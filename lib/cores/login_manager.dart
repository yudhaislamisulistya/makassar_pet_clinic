// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:makassar_pet_clinic/cores/cache_manager.dart';

class LoginManager extends GetxController with CacheManager {
  final isAuthenticated = false.obs;
  final id = ''.obs;
  final name = ''.obs;
  final username = ''.obs;
  final password = ''.obs;
  final role = ''.obs;
  final idCustomer = ''.obs;
  final nameCustomer = ''.obs;
  final emailCustomer = ''.obs;
  final addressCustomer = ''.obs;
  final phoneCustomer = ''.obs;
  final petType = ''.obs;
  final petName = ''.obs;
  final petAge = ''.obs;
  final petGender = ''.obs;
  final idExpert = ''.obs;
  final nameDoctor = ''.obs;
  final emailDoctor = ''.obs;
  final addressDoctor = ''.obs;
  final phoneDoctor = ''.obs;
  final specializationDoctor = ''.obs;
  final experienceYearDoctor = ''.obs;
  final aboutDoctor = ''.obs;
  final avatarDoctor = ''.obs;

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
      setUser();
    }
  }

  void setUser() {
    final user = getUser();
    id.value = user['id'];
    name.value = user['name'];
    username.value = user['username'];
    password.value = user['password'];
    role.value = user['role'];
    if (user['role'] == '3') {
      idCustomer.value = user['idCustomer'];
      nameCustomer.value = user['nameCustomer'];
      emailCustomer.value = user['emailCustomer'];
      addressCustomer.value = user['addressCustomer'];
      phoneCustomer.value = user['phoneCustomer'];
      petType.value = user['petType'];
      petName.value = user['petName'];
      petAge.value = user['petAge'];
      petGender.value = user['petGender'];
    } else if (user['role'] == '2') {
      idExpert.value = user['idExpert'];
      nameDoctor.value = user['nameDoctor'];
      emailDoctor.value = user['emailDoctor'];
      addressDoctor.value = user['addressDoctor'];
      phoneDoctor.value = user['phoneDoctor'];
      specializationDoctor.value = user['specializationDoctor'];
      experienceYearDoctor.value = user['experienceYearDoctor'];
      aboutDoctor.value = user['aboutDoctor'];
      avatarDoctor.value = user['avatarDoctor'];
    } else if (user['role'] == '1') {}
  }
}
