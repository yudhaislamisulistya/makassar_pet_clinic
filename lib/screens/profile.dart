// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';
import 'package:makassar_pet_clinic/screens/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => AboutState();
}

class AboutState extends State<Profile> {
  final LoginManager loginManager = Get.put(LoginManager());
  @override
  Widget build(BuildContext context) {
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
              Stack(
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
                                "assets/images/doctor1.jpeg",
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Yudha Islami Sulistya",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "yudhamaster77@gmail.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // make listile logout
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pengaturan',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(
                          AlertDialog(
                            title: const Text('Dark Mode'),
                            content: const Text('Apakah anda ingin mengaktifkan dark mode?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('Tidak'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('Ya'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: ListInformasiLainnya(
                        title: 'Dark Mode',
                        subtitle: "Aktifkan Dark Mode",
                        icon: Icons.dark_mode_outlined,
                      ),
                    ),
                    Text(
                      'Akun',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    ListInformasiLainnya(
                      title: 'Akses',
                      subtitle: loginManager.role.value == "1"
                          ? "Admin"
                          : loginManager.role.value == "2"
                              ? "Expert"
                              : loginManager.role.value == "3"
                                  ? "User"
                                  : "User",
                      icon: Icons.lock_clock_outlined,
                    ),
                    ListInformasiLainnya(
                      title: 'Status',
                      subtitle: "Aktif",
                      icon: Icons.verified_outlined,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Informasi Lainnya',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    ListInformasiLainnya(
                      title: 'Version Date',
                      subtitle: appVersionDate,
                    ),
                    ListInformasiLainnya(
                      title: 'Version',
                      subtitle: appVersion,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                          title: "Logout",
                          middleText: "Apakah Anda Ingin Logout?",
                          textConfirm: "Yes",
                          textCancel: "No",
                          confirmTextColor: Colors.white,
                          buttonColor: colorPrimary,
                          barrierDismissible: false,
                          onConfirm: () {
                            loginManager.logOut();
                            Get.offAll(() => const Login());
                            Get.back();
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 4, bottom: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0.2,
                              blurRadius: 10,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        child: ListTile(
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          leading: const Icon(
                            Icons.logout,
                            color: colorPrimary,
                          ),
                          title: const Text(
                            'Logout',
                            style: TextStyle(
                              color: colorPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
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

class ListInformasiLainnya extends StatelessWidget {
  String? title;
  String? subtitle;
  IconData? icon;
  ListInformasiLainnya({
    this.title,
    this.subtitle,
    this.icon,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0.2,
            blurRadius: 10,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: ListTile(
        tileColor: Colors.white,
        leading: SizedBox(
          height: double.infinity,
          child: Icon(
            icon ?? Icons.info_outline,
            color: colorPrimary,
          ),
        ),
        title: Text(
          title ?? '-',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle ?? '-',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
