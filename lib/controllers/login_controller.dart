import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';
import 'package:makassar_pet_clinic/models/login/login_request_model.dart';
import 'package:makassar_pet_clinic/screens/home.dart';
import 'package:makassar_pet_clinic/services/login_service.dart';

class LoginController extends GetxController {
  late final LoginService loginService;
  late final LoginManager loginManager;

  @override
  void onInit() {
    loginService = Get.put(LoginService());
    loginManager = Get.put(LoginManager());
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
      var user = {
        "id": response.users.first.id.toString(),
        "name": response.users.first.name,
        "username": response.users.first.username,
        "password": response.users.first.password,
        "role": response.users.first.role,
      };
      loginManager.logIn(user['username'], user);
      Get.offAll(() => const Home());
    }
  }
}
