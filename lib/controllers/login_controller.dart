import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/customer_controller.dart';
import 'package:makassar_pet_clinic/controllers/doctor_controller.dart';
import 'package:makassar_pet_clinic/cores/customer_manager.dart';
import 'package:makassar_pet_clinic/cores/doctor_manager.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';
import 'package:makassar_pet_clinic/models/login/login_request_model.dart';
import 'package:makassar_pet_clinic/screens/home_admin.dart';
import 'package:makassar_pet_clinic/screens/home_customer_expert.dart';
import 'package:makassar_pet_clinic/services/login_service.dart';

class LoginController extends GetxController {
  late final LoginService loginService;
  late final LoginManager loginManager;
  late final CustomerController customerController;
  late final CustomerManager customerManager;
  late final DoctorController doctorController;
  late final DoctorManager doctorManager;

  @override
  void onInit() {
    loginService = Get.put(LoginService());
    loginManager = Get.put(LoginManager());
    customerController = Get.put(CustomerController());
    customerManager = Get.put(CustomerManager());
    doctorController = Get.put(DoctorController());
    doctorManager = Get.put(DoctorManager());
    super.onInit();
  }

  Future<void> getUser(String username, String password) async {
    final response = await loginService.getUser(LoginRequestModel(username: username, password: password));
    // Get Loading and Future Delayed 3 Seconds
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
    );
    await Future.delayed(const Duration(seconds: 3), () {
      Get.back();
    });
    if (response == null) {
      Get.showSnackbar(snackBarError("Gagal Login, Username atau Password Salah"));
    } else {
      dynamic user;
      if (response.users.first.role == "3") {
        await customerController.getCustomerByIdUser(response.users.first.id);
        user = {
          "id": response.users.first.id.toString(),
          "name": response.users.first.name,
          "username": response.users.first.username,
          "password": response.users.first.password,
          "role": response.users.first.role,
          "idCustomer": customerManager.customer.first.id.toString(),
          "nameCustomer": customerManager.customer.first.name.toString(),
          "emailCustomer": customerManager.customer.first.email.toString(),
          "addressCustomer": customerManager.customer.first.address.toString(),
          "phoneCustomer": customerManager.customer.first.phone.toString(),
          "petType": customerManager.customer.first.petType.toString(),
          "petName": customerManager.customer.first.petName.toString(),
          "petAge": customerManager.customer.first.petAge.toString(),
          "petGender": customerManager.customer.first.petGender.toString(),
        };
      } else if (response.users.first.role == "2") {
        await doctorController.getDoctorByIdExpert(response.users.first.id);
        user = {
          "id": response.users.first.id.toString(),
          "name": response.users.first.name,
          "username": response.users.first.username,
          "password": response.users.first.password,
          "role": response.users.first.role,
          "idExpert": doctorManager.doctor.first.id.toString(),
          "nameDoctor": doctorManager.doctor.first.name.toString(),
          "emailDoctor": doctorManager.doctor.first.email.toString(),
          "specializationDoctor": doctorManager.doctor.first.specialization.toString(),
          "experienceYearDoctor": doctorManager.doctor.first.experienceYears.toString(),
          "aboutDoctor": doctorManager.doctor.first.about.toString(),
          "phoneDoctor": doctorManager.doctor.first.phone.toString(),
          "addressDoctor": doctorManager.doctor.first.address.toString(),
          "avatarDoctor": doctorManager.doctor.first.avatar.toString(),
        };
      } else if (response.users.first.role == "1") {
        user = {
          "id": response.users.first.id.toString(),
          "name": response.users.first.name,
          "username": response.users.first.username,
          "password": response.users.first.password,
          "role": response.users.first.role,
        };
      }

      loginManager.logIn(user['username'], user);
      if (user['role'] == "3") {
        Get.offAll(() => const HomeCustomerExpert());
      } else if (user['role'] == "2") {
        Get.offAll(() => const HomeCustomerExpert());
      } else if (user['role'] == "1") {
        Get.offAll(() => const HomeAdmin());
      }
    }
  }
}
