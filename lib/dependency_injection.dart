import 'package:get/get.dart';
import 'package:vardaan/dashboard/Authentications/doctor_controller/add_patient_controller.dart';
import 'package:vardaan/dashboard/Authentications/doctor_controller/doctor_login_controller.dart';
import 'package:vardaan/dashboard/Authentications/doctor_controller/doctor_register_controller.dart';
import 'package:vardaan/dashboard/Authentications/doctor_controller/search_patient_controller.dart';
import 'package:vardaan/dashboard/Authentications/doctor_controller/update_patient_controller.dart';
import 'package:vardaan/dashboard/Authentications/patient_controllers/patient_login_controller.dart';
import 'package:vardaan/dashboard/doctor_home_screen/screens/patient_login_screen.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/homescreen_controller.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/map_controller.dart';

class DependenciesInjections {
  static Future<void> init() async {
    Get.lazyPut<HomescreenController>(
      () => HomescreenController(),
      fenix: true,
    );
    Get.lazyPut<MapController>(() => MapController(), fenix: true);
    Get.lazyPut<ListController>(() => ListController(), fenix: true);
    Get.lazyPut<Change>(() => Change(), fenix: true);
    Get.lazyPut<DoctorCreateController>(
      () => DoctorCreateController(),
      fenix: true,
    );
    Get.lazyPut<PatientLoginScreen>(() => PatientLoginScreen(), fenix: true);
    Get.lazyPut<DoctorLoginController>(
      () => DoctorLoginController(),
      fenix: true,
    );
    Get.lazyPut<PatientLoginController>(
      () => PatientLoginController(),
      fenix: true,
    );
    Get.lazyPut<FindController>(() => FindController(), fenix: true);
  }
}
