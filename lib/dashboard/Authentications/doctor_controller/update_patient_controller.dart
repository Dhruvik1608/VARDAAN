import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vardaan/utils/colors.dart';

class Change extends GetxController {
  final TextEditingController PatientId = TextEditingController();
  final TextEditingController ContactNo = TextEditingController();
  final TextEditingController EmailId = TextEditingController();
  final TextEditingController AddConsultant = TextEditingController();
  final TextEditingController AddHealthStatus = TextEditingController();
  final formkey = GlobalKey<FormState>();
  var documentFileName = ''.obs;

  void setDocumentFileName(String fileName) {
    documentFileName.value = fileName;
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
      String patientId = PatientId.text.trim();

      if (ContactNo.text.isEmpty &&
          EmailId.text.isEmpty &&
          AddConsultant.text.isEmpty &&
          AddHealthStatus.text.isEmpty &&
          pickedFile == null) {
        print('No fields filled and no document picked');
        return;
      }

      try {
        DocumentSnapshot snapshot =
            await FirebaseFirestore.instance
                .collection('Patient')
                .doc(patientId)
                .get();

        if (snapshot.exists) {
          Map<String, dynamic> updateData = {};

          if (ContactNo.text.isNotEmpty) {
            updateData['Mno'] = ContactNo.text.trim();
          }

          if (EmailId.text.isNotEmpty) {
            updateData['Email'] = EmailId.text.trim();
          }

          if (AddConsultant.text.isNotEmpty) {
            String existingConsultant = snapshot['Consulting'] ?? '';
            String newConsultant = AddConsultant.text.trim();
            updateData['Consulting'] =
                (existingConsultant.isEmpty ? '' : '$existingConsultant, ') +
                newConsultant;
          }

          if (AddHealthStatus.text.isNotEmpty) {
            String existingHealthStatus = snapshot['Health'] ?? '';
            String newHealthStatus = AddHealthStatus.text.trim();
            updateData['Health'] =
                (existingHealthStatus.isEmpty
                    ? ''
                    : '$existingHealthStatus, ') +
                newHealthStatus;
          }

          if (updateData.isNotEmpty) {
            await FirebaseFirestore.instance
                .collection('Patient')
                .doc(patientId)
                .update(updateData);

            Get.snackbar(
              'Success',
              'Patient details updated successfully',
              colorText: visualsColor.white,
              backgroundColor: Colors.grey.shade600,
            );
            clearForm();
          } else {
            print('No fields to update');
          }

          if (pickedFile != null) {
            String folderName = 'patients/$patientId';
            firebase_storage.Reference documentRef = firebase_storage
                .FirebaseStorage
                .instance
                .ref()
                .child('$folderName/${documentFileName.value}');

            try {
              firebase_storage.FullMetadata metadata =
                  await firebase_storage.FirebaseStorage.instance
                      .ref('$folderName/dummy.txt')
                      .getMetadata();
              if (metadata != null) {
                await firebase_storage.FirebaseStorage.instance
                    .ref('$folderName/dummy.txt')
                    .delete();
              }
            } catch (e) {
              print('dummy.txt does not exist');
            }

            await documentRef.putFile(pickedFile!);

            Get.snackbar(
              'Success',
              'File uploaded successfully',
              colorText: visualsColor.white,
              backgroundColor: Colors.grey.shade600,
            );
            clearForm();
          } else {
            print('No document picked');
          }
        } else {
          Get.snackbar(
            'Error',
            'Patient ID does not exist',
            colorText: visualsColor.white,
            backgroundColor: Colors.grey.shade600,
          );
        }
      } catch (e) {
        print('Error updating patient details: $e');
        Get.snackbar(
          'Error',
          'Failed to update patient details or upload file',
          colorText: visualsColor.white,
          backgroundColor: Colors.grey.shade600,
        );
      }
    }
  }

  void clearForm() {
    PatientId.clear();
    ContactNo.clear();
    EmailId.clear();
    AddConsultant.clear();
    AddHealthStatus.clear();
    pickedFile = null;
    documentFileName.value = '';
  }
}
