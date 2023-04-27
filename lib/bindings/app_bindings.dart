import 'package:get/get.dart';
import 'package:makassar_pet_clinic/controllers/booking_controller.dart';
import 'package:makassar_pet_clinic/controllers/category_controller.dart';
import 'package:makassar_pet_clinic/controllers/customer_controller.dart';
import 'package:makassar_pet_clinic/controllers/doctor_controller.dart';
import 'package:makassar_pet_clinic/controllers/information_controller.dart';
import 'package:makassar_pet_clinic/controllers/login_controller.dart';
import 'package:makassar_pet_clinic/controllers/pet_beauty_controller.dart';
import 'package:makassar_pet_clinic/controllers/pet_clinic_controller.dart';
import 'package:makassar_pet_clinic/cores/booking_manager.dart';
import 'package:makassar_pet_clinic/cores/category_manager.dart';
import 'package:makassar_pet_clinic/cores/customer_manager.dart';
import 'package:makassar_pet_clinic/cores/doctor_manager.dart';
import 'package:makassar_pet_clinic/cores/information_manager.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';
import 'package:makassar_pet_clinic/cores/pet_beuaty_manager.dart';
import 'package:makassar_pet_clinic/cores/pet_clinic_manager.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
    Get.put(CategoryManager());
    Get.put(DoctorController());
    Get.put(DoctorManager());
    Get.put(LoginController());
    Get.put(LoginManager());
    Get.put(CustomerController());
    Get.put(CustomerManager());
    Get.put(BookingController());
    Get.put(BookingManager());
    Get.put(InformationController());
    Get.put(InformationManager());
    Get.put(PetBeautyController());
    Get.put(PetBeautyManager());
    Get.put(PetClinicController());
    Get.put(PetClinicManager());
  }
}
