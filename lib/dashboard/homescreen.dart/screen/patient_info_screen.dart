import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/emoji_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/info_small_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/info_small_perticuler_container.dart';
import 'package:vardaan/dashboard/homescreen.dart/section/on_and_on_container.dart';
import 'package:vardaan/utils/colors.dart';
import 'package:vardaan/utils/pdf_view.dart';

class PatientInfoScreen extends StatelessWidget {
  PatientInfoScreen({super.key});
  final userData = GetStorage();
  Future<bool> doesFolderExist() async {
    firebase_storage.Reference patientFolderRef = firebase_storage
        .FirebaseStorage
        .instance
        .ref()
        .child('patients//${userData.read("Id")}');

    try {
      await patientFolderRef.listAll();
      return true;
    } catch (e) {
      print('Folder does not exist: $e');
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> fetchDocumentNamesWithMetadata() async {
    try {
      firebase_storage.Reference patientFolderRef = firebase_storage
          .FirebaseStorage
          .instance
          .ref()
          .child('patients//${userData.read("Id")}');
      firebase_storage.ListResult listResult = await patientFolderRef.listAll();

      List<Map<String, dynamic>> documents = [];

      await Future.forEach(listResult.items, (
        firebase_storage.Reference item,
      ) async {
        firebase_storage.FullMetadata metadata = await item.getMetadata();
        if (metadata != null && metadata.timeCreated != null) {
          documents.add({
            'name': item.name,
            'uploadDateTime': metadata.timeCreated,
          });
        }
      });

      return documents;
    } catch (e) {
      print('Error fetching documents with metadata: $e');
      return [];
    }
  }

  Future<Map<String, String>> fetchDocumentUrls() async {
    try {
      firebase_storage.Reference patientFolderRef = firebase_storage
          .FirebaseStorage
          .instance
          .ref()
          .child('patients/${userData.read("Id")}');
      firebase_storage.ListResult listResult = await patientFolderRef.listAll();

      Map<String, String> urls = {};

      await Future.forEach(listResult.items, (
        firebase_storage.Reference item,
      ) async {
        String url = await item.getDownloadURL();
        urls[item.name] = url;
      });

      return urls;
    } catch (e) {
      print('Error fetching document URLs: $e');
      return {};
    }
  }

  void openDocument(BuildContext context, String docName, String docUrl) {
    Get.to(() => PDFViewerPage(docUrl: docUrl, docName: docName));
  }

  Future<String?> getDocumentUrl(String docName) async {
    try {
      firebase_storage.Reference docRef = firebase_storage
          .FirebaseStorage
          .instance
          .ref()
          .child('patients//${userData.read("Id")}/$docName');
      return await docRef.getDownloadURL();
    } catch (e) {
      print('Error fetching document URL: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: visualsColor.withBarBackground),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 183.h),
              OnAndOnContainer(
                id: userData.read("Id"),
                age: userData.read("Age").toString(),
                gender: userData.read("Gender"),
                name: userData.read("Name"),
                emoji: "assets/emojis/wavingHand.png",
                title: "Information",
              ),
              const SizedBox(height: 12),
              InfoSmallPerticulerContainer(
                title: "Parent Detail",
                cond: true,
                value1: userData.read("FName"),
                value2: userData.read("MName"),
              ),
              const SizedBox(height: 12),
              InfoSmallPerticulerContainer(
                title: "Contact Detail",
                cond: false,
                value1: userData.read("MNo"),
                value2: userData.read("Email"),
              ),
              const SizedBox(height: 12),
              InfoSmallContainer(
                title: "Cunsulted With",
                emoji: "assets/emojis/closedEyes.png",
                consultant: userData.read("Consulting"),
              ),
              const SizedBox(height: 12),
              InfoSmallContainer(
                title: "Health Status",
                emoji: "assets/emojis/heartDecoration.png",
                consultant: userData.read("Health"),
              ),

              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: visualsColor.mintlight,
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 22.w),
                          child: const Text(
                            "Documents",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: visualsColor.midNightAllOverBlack,
                            ),
                          ),
                        ),
                        FutureBuilder<bool>(
                          future: doesFolderExist(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.data == true) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6.0.w,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FutureBuilder<List<Map<String, dynamic>>>(
                                      future: fetchDocumentNamesWithMetadata(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else if (snapshot.hasError) {
                                          return Text(
                                            'Error: ${snapshot.error}',
                                          );
                                        } else if (snapshot.hasData &&
                                            snapshot.data!.isNotEmpty) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children:
                                                snapshot.data!.map((docData) {
                                                  String docName =
                                                      docData['name'];
                                                  DateTime uploadDateTime =
                                                      docData['uploadDateTime'];

                                                  return GestureDetector(
                                                    onTap: () async {
                                                      String? docUrl =
                                                          await getDocumentUrl(
                                                            docName,
                                                          );
                                                      if (docUrl != null) {
                                                        openDocument(
                                                          context,
                                                          docName,
                                                          docUrl,
                                                        );
                                                      } else {
                                                        print("Url is null");
                                                      }
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            visualsColor.mint,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              24.r,
                                                            ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                              16.w,
                                                              10.h,
                                                              16.w,
                                                              11.h,
                                                            ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              docName,
                                                              style: const TextStyle(
                                                                fontSize: 16,

                                                                color: Color(
                                                                  0xffffffff,
                                                                ),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .bottomRight,
                                                              child: Text(
                                                                uploadDateTime
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                  fontSize: 14,

                                                                  color: Color(
                                                                    0xffffffff,
                                                                  ),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                          );
                                        } else {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 6.w,
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: visualsColor.mint,
                                                borderRadius:
                                                    BorderRadius.circular(24.r),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                  16.w,
                                                  10.h,
                                                  16.w,
                                                  11.h,
                                                ),
                                                child: const Text(
                                                  "No document found",
                                                  style: TextStyle(
                                                    fontSize: 16,

                                                    color: visualsColor.white,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: visualsColor.mint,
                                    borderRadius: BorderRadius.circular(24.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                      16.w,
                                      10.h,
                                      16.w,
                                      11.h,
                                    ),
                                    child: const Text(
                                      "No document found for this patient",
                                      style: TextStyle(
                                        fontSize: 16,

                                        color: visualsColor.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                    Positioned(
                      right: 12.w,
                      top: 8.h,
                      child: EmojiContainer(
                        image: "assets/emojis/books.png",
                        color2: visualsColor.mintlight,
                        color1: visualsColor.mint,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}


// Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 6.w),
//                 child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: visualsColor.mint,
//                     borderRadius: BorderRadius.circular(24.r),
//                   ),
//                   child: Padding( //                     padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 11),
//                     child: Text(
//                       "No document found",
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         color: visualsColor.white,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),