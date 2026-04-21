import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vardaan/dashboard/Authentications/doctor_controller/update_patient_controller.dart';
import 'package:vardaan/dashboard/doctor_home_screen/sections/add_document.dart';
import 'package:vardaan/dashboard/doctor_home_screen/sections/add_patient_container.dart';
import 'package:vardaan/dashboard/doctor_home_screen/sections/button_section.dart';
import 'package:vardaan/utils/colors.dart';

class UpdatePatientScreen extends StatelessWidget {
  const UpdatePatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Change controller = Get.find<Change>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 183.h),
              AddPatientContainer(
                controller: controller.PatientId,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Id';
                  }
                  return null;
                },
                readOnly: false,
                isAddPatient: false,
                title: "Patient ID",
                emoji: "assets/emojis/blush.png",
                hint: "Enter Patient ID..",
              ),
              const SizedBox(height: 7),
              Divider(thickness: 2.sp, color: visualsColor.peach),
              const SizedBox(height: 7),
              AddPatientContainer(
                controller: controller.ContactNo,
                readOnly: false,
                isAddPatient: false,
                title: "Change Contact no",
                emoji: "assets/emojis/openEyes.png",
                hint: "Enter new contact no..",
              ),
              const SizedBox(height: 12),
              AddPatientContainer(
                readOnly: false,
                controller: controller.EmailId,
                isAddPatient: false,
                title: "Change Email ID",
                emoji: "assets/emojis/nerdFace.png",
                hint: "Enter new email id..",
              ),
              const SizedBox(height: 12),
              AddPatientContainer(
                readOnly: false,
                controller: controller.AddConsultant,
                isAddPatient: false,
                title: "Add Consultant",
                emoji: "assets/emojis/blush.png",
                hint: "Enter consultant name..",
              ),
              const SizedBox(height: 12),
              AddPatientContainer(
                isAddPatient: false,
                readOnly: false,
                controller: controller.AddHealthStatus,
                title: "Add Health Status",
                emoji: "assets/emojis/openEyes.png",
                hint: "Enter consultant name..",
              ),
              const SizedBox(height: 12),
              Center(
                child: InkWell(
                  onTap: () {
                    print('Container tapped');
                    controller.pickDocument();
                  },
                  child: AddDocument(isAddPatient: false),
                ),
              ),

              const SizedBox(height: 10),
              Divider(thickness: 2.sp, color: visualsColor.peach),
              const SizedBox(height: 10),
              ButtonSection(
                isAddPatient: false,
                onClear: () {
                  controller.clearForm();
                },
                onSubmit: () {
                  controller.submitForm();
                },
              ),
              const SizedBox(height: 10),
              Divider(thickness: 2.sp, color: visualsColor.peach),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
