import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/Authentications/doctor_controller/add_patient_controller.dart';
import 'package:vardaan/dashboard/doctor_home_screen/sections/add_document.dart';
import 'package:vardaan/dashboard/doctor_home_screen/sections/add_patient_container.dart';
import 'package:vardaan/dashboard/doctor_home_screen/sections/age_and_gender_section.dart';
import 'package:vardaan/dashboard/doctor_home_screen/sections/button_section.dart';
import 'package:vardaan/utils/colors.dart';

class AddPatientScreen extends StatelessWidget {
  const AddPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ListController controller = Get.find<ListController>();
    return Container(
      color: visualsColor.withBarBackground,
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 0.h, 24.w, 0.h),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 183.h),
                AddPatientContainer(
                  readOnly: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  controller: controller.Name,
                  isAddPatient: true,
                  hint: "Enter patient name..",
                  title: "Name",
                  emoji: "assets/emojis/blush.png",
                ),
                const SizedBox(height: 12),
                AddPatientContainer(
                  controller: controller.DateOfBirth,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      controller.calculateAge(pickedDate);
                      controller.DateOfBirth.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select date of birth';
                    }
                    return null;
                  },
                  isAddPatient: true,
                  hint: "Select Date Of Birth",
                  title: "Date Of Birth",
                  emoji: "assets/emojis/openEyes.png",
                ),
                const SizedBox(height: 12),
                AgeAndGenderSection(),
                const SizedBox(height: 12),
                AddPatientContainer(
                  controller: controller.FatherName,
                  readOnly: false,
                  isAddPatient: true,
                  hint: "Enter patient's father name..",
                  title: "Father Name",
                  emoji: "assets/emojis/nerdFace.png",
                ),
                const SizedBox(height: 12),
                AddPatientContainer(
                  controller: controller.MotherName,
                  readOnly: false,
                  isAddPatient: true,
                  hint: "Enter patient's mother name..",
                  title: "Mother Name",
                  emoji: "assets/emojis/blush.png",
                ),
                const SizedBox(height: 12),
                AddPatientContainer(
                  controller: controller.ContactNo,
                  readOnly: false,
                  isAddPatient: true,
                  hint: "Enter patient's contact no..",
                  title: "Contact no.",
                  emoji: "assets/emojis/openEyes.png",
                ),
                const SizedBox(height: 12),
                AddPatientContainer(
                  controller: controller.EmailId,
                  readOnly: false,
                  isAddPatient: true,
                  hint: "Enter patient's email id..",
                  title: "Email ID",
                  emoji: "assets/emojis/closedEyes.png",
                ),

                const SizedBox(height: 12),
                AddPatientContainer(
                  controller: controller.Consultant,
                  readOnly: false,
                  isAddPatient: true,
                  hint: "Enter patient's consulted with..",
                  title: "Consulted with",
                  emoji: "assets/emojis/blush.png",
                ),
                const SizedBox(height: 12),
                AddPatientContainer(
                  controller: controller.Health,
                  readOnly: false,
                  isAddPatient: true,
                  hint: "Enter patient's health status..",
                  title: "Health Status",
                  emoji: "assets/emojis/openEyes.png",
                ),
                const SizedBox(height: 12),
                Center(
                  child: InkWell(
                    onTap: () {
                      print('Container tapped');
                      controller.pickDocument();
                    },
                    child: AddDocument(isAddPatient: true),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 2, color: visualsColor.violet),
                const SizedBox(height: 10),
                ButtonSection(
                  isAddPatient: true,
                  onClear: () {
                    controller.clearForm();
                  },
                  onSubmit: () {
                    if (controller.areAllFieldsFilled()) {
                      controller.submitForm();
                    } else {
                      Get.snackbar(
                        'Error',
                        'Please fill all details',
                        colorText: visualsColor.white,
                        backgroundColor: Colors.grey.shade600,
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 2, color: visualsColor.violet),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
