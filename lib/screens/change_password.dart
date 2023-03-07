// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/user_controller.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => ChangePasswordState();
}

class ChangePasswordState extends State<ChangePassword> {
  final LoginManager loginManager = Get.put(LoginManager());
  final UserController userController = Get.put(UserController());
  late String name = '';
  late String email = '';
  late String avatar = 'assets/images/person.png';

  TextEditingController passwordLamaController = TextEditingController();
  TextEditingController passwordBaruController = TextEditingController();

  @override
  void initState() {
    super.initState();
    asyncMethod();
  }

  void asyncMethod() async {
    Future.delayed(const Duration(milliseconds: 500), () {
      loginManager.setUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loginManager.role.value == "3") {
      name = loginManager.nameCustomer.value;
      email = loginManager.emailCustomer.value;
      avatar = 'assets/images/person.png';
    } else if (loginManager.role.value == "2") {
      name = loginManager.nameDoctor.value;
      email = loginManager.emailDoctor.value;
      avatar = loginManager.avatarDoctor.value;
    } else {
      name = loginManager.name.value;
      email = "admin@gmail.com";
    }
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(),
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: colorPrimary,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Obx(
                () {
                  if (loginManager.isAuthenticated.value) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            width: Get.width,
                            color: colorPrimary,
                            child: SvgPicture.asset(
                              'assets/svg/header_two.svg',
                              width: Get.width,
                              height: Get.height * 0.2,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          height: Get.height * 0.2,
                          width: Get.width,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                colorPrimary,
                                colorPrimaryLight,
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25.0),
                              bottomRight: Radius.circular(25.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(3), // Border radius
                                  child: ClipOval(
                                    child: Image.asset(
                                      avatar,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                email,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height / 4),
                        const Center(child: CircularProgressIndicator()),
                      ],
                    );
                  }
                },
              ),

              const SizedBox(
                height: 20,
              ),
              // make listile logout
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Pengaturan',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // make change name customer with padding
                    InputTextField(
                      controller: passwordLamaController,
                      hintText: 'Masukkan Password Lama',
                      value: loginManager.password.value,
                      disabledInput: false,
                    ),
                    InputTextField(
                      controller: passwordBaruController,
                      hintText: 'Masukkan Pasword Baru',
                      value: "",
                      disabledInput: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // make button save
                    SizedBox(
                      width: Get.width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (passwordLamaController.text == loginManager.password.value) {
                            if (passwordBaruController.text.isEmpty) {
                              Get.showSnackbar(snackBarError("Password Baru Tidak Boleh Kosong"));
                            } else {
                              userController.updatePassword(int.parse(loginManager.id.value), passwordBaruController.text);
                            }
                          } else {
                            Get.snackbar("Gagal", "Password Lama Salah");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.value,
    required this.disabledInput,
  });

  final TextEditingController controller;
  final String hintText;
  final String value;
  final bool disabledInput;

  @override
  Widget build(BuildContext context) {
    controller.text = value;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          enabled: disabledInput,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
