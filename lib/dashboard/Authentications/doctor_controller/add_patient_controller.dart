import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ListController extends GetxController {
  var selectedGender = ''.obs;
  var age = 0.obs;
  var documentFileName = ''.obs;
  var documentDownloadURL = ''.obs;
  var permissionRequested = false.obs;

  final formkey = GlobalKey<FormState>();
  final TextEditingController Name = TextEditingController();
  final TextEditingController DateOfBirth = TextEditingController();
  final TextEditingController FatherName = TextEditingController();
  final TextEditingController MotherName = TextEditingController();
  final TextEditingController ContactNo = TextEditingController();
  final TextEditingController EmailId = TextEditingController();
  final TextEditingController Consultant = TextEditingController();
  final TextEditingController Health = TextEditingController();
  final userData = GetStorage();

  void setDocumentFileName(String fileName) {
    documentFileName.value = fileName;
  }

  void setSelectedGender(String gender) {
    selectedGender.value = gender;
  }

  void setDocumentDownloadURL(String url) {
    documentDownloadURL.value = url;
  }

  void calculateAge(DateTime dob) {
    DateTime currentDate = DateTime.now();
    int ageValue = currentDate.year - dob.year;
    if (currentDate.month < dob.month ||
        (currentDate.month == dob.month && currentDate.day < dob.day)) {
      ageValue--;
    }
    age.value = ageValue;
  }

  bool areAllFieldsFilled() {
    return Name.text.isNotEmpty &&
        DateOfBirth.text.isNotEmpty &&
        FatherName.text.isNotEmpty &&
        MotherName.text.isNotEmpty &&
        ContactNo.text.isNotEmpty &&
        EmailId.text.isNotEmpty &&
        Consultant.text.isNotEmpty &&
        Health.text.isNotEmpty;
  }

  File? pickedFile;

  Future<void> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      pickedFile = File(result.files.single.path!);
      String? fileName = result.files.single.name;
      print('Picked document: $fileName');
      setDocumentFileName(fileName ?? '');
    } else {
      print('User canceled the picker');
    }
  }

  Future<void> submitForm() async {
    if (formkey.currentState!.validate()) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference patients = firestore.collection('Patient');

      String patientId = generateUniqueID();
      try {
        if (pickedFile == null) {
          firebase_storage.Reference patientFolderRef = firebase_storage
              .FirebaseStorage
              .instance
              .ref()
              .child('patients/$patientId/');
          await patientFolderRef.child('dummy.txt').putData(Uint8List(0));
        }
      } catch (e) {
        print('Error creating patient folder: $e');
      }

      if (pickedFile != null) {
        try {
          firebase_storage.Reference documentRef = firebase_storage
              .FirebaseStorage
              .instance
              .ref()
              .child('patients/$patientId/${documentFileName.value}');
          await documentRef.putFile(pickedFile!);
          String downloadURL = await documentRef.getDownloadURL();
          setDocumentDownloadURL(downloadURL);
        } catch (e) {
          print('Error uploading document: $e');
        }
      }
      String lowercaseName = Name.text.toLowerCase();

      Map<String, dynamic> patientData = {
        'ID': patientId,
        'Name': lowercaseName,
        'Age': age.value,
        'Gender': selectedGender.value,
        'FName': FatherName.text,
        'MName': MotherName.text,
        'Mno': ContactNo.text,
        'Email': EmailId.text,
        'Consulting': Consultant.text,
        'Health': Health.text,
        'DocumentFileName': documentFileName.value,
        'DocumentDownloadURL': documentDownloadURL.value,
      };

      await patients.doc(patientId).set(patientData);

      userData.write("isLogged", true);
      userData.write("Name", patientData['Name']);
      userData.write("Email", patientData['Email']);
      userData.write("Id", patientData[patientId].toString());
      userData.write("Age", patientData['Age'].toString());
      userData.write("Gender", patientData['Gender']);
      userData.write("FName", patientData['FName']);
      userData.write("MName", patientData['MName']);
      userData.write("MNo", patientData['MNo'].toString());
      userData.write("Consulting", patientData['Consulting']);
      userData.write("Health", patientData['Health']);
      userData.write("DocumentFileName", patientData['DocumentFileName']);
      userData.write("DocumentDownloadURL", patientData['DocumentDownloadURL']);
      clearForm();
      Get.snackbar(
        'Success',
        'Patient details added successfully',
        colorText: Colors.green,
        backgroundColor: Colors.grey.shade600,
      );
    }
  }

  String generateUniqueID() {
    const _chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const _idLength = 5;
    final _rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(
        _idLength,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );
  }

  void clearForm() {
    Name.clear();
    FatherName.clear();
    MotherName.clear();
    ContactNo.clear();
    EmailId.clear();
    Consultant.clear();
    Health.clear();
    selectedGender.value = '';
    age.value = 0;
    pickedFile = null;
    documentFileName.value = '';
    documentDownloadURL.value = '';
  }
}
