import 'package:get/get.dart';
import 'package:makassar_pet_clinic/controllers/category_controller.dart';
import 'package:makassar_pet_clinic/controllers/doctor_controller.dart';
import 'package:makassar_pet_clinic/controllers/login_controller.dart';
import 'package:makassar_pet_clinic/cores/category_manager.dart';
import 'package:makassar_pet_clinic/cores/doctor_manager.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
    Get.put(CategoryManager());
    Get.put(DoctorController());
    Get.put(DoctorManager());
    Get.put(LoginController());
    Get.put(LoginManager());
  }
}
