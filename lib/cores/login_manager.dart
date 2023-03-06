// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:makassar_pet_clinic/cores/cache_manager.dart';

class LoginManager extends GetxController with CacheManager {
  final isAuthenticated = false.obs;
  final isIntroductionStep = false.obs;
  final isShowcaseCompleted = false.obs;
  final id = ''.obs;
  final name = ''.obs;
  final username = ''.obs;
  final password = ''.obs;
  final role = ''.obs;

  void logOut() async {
    isAuthenticated.value = false;
    await removeUsernameAndUserid();
  }

  void logIn(String? username, Map<String, String?> user) async {
    isAuthenticated.value = true;
    await saveUsername(username);
    await saveUser(user['id'], user);
  }

  void checkLoginStatus() async {
    final username = getUsername();
    if (username != null) {
      isAuthenticated.value = true;
    }
  }

  void setUser() {
    final user = getUser();
    id.value = user['id'];
    name.value = user['name'];
    username.value = user['username'];
    password.value = user['password'];
    role.value = user['role'];
  }
}
