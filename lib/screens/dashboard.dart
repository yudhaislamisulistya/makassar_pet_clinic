// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/components/category.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/category_controller.dart';
import 'package:makassar_pet_clinic/controllers/doctor_controller.dart';
import 'package:makassar_pet_clinic/cores/category_manager.dart';
import 'package:makassar_pet_clinic/cores/doctor_manager.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';

import 'package:makassar_pet_clinic/screens/category.dart' as category_screen;
import 'package:makassar_pet_clinic/screens/doctor.dart' as doctor_screen;
import 'package:makassar_pet_clinic/components/doctor.dart' as doctor_component;
import 'package:makassar_pet_clinic/screens/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DoctorController doctorController = Get.put(DoctorController());
  final DoctorManager doctorManager = Get.put(DoctorManager());
  final CategoryController categoryController = Get.put(CategoryController());
  final CategoryManager categoryManager = Get.put(CategoryManager());
  final LoginManager loginManager = Get.put(LoginManager());

  late String avatar = 'assets/images/person.png';
  @override
  void initState() {
    doctorManager.doctor.clear();
    categoryManager.category.clear();
    loginManager.setUser();
    super.initState();
    Future.delayed(Duration.zero, () {
      doctorController.getDoctor();
      categoryController.getCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Check Good Morning, Afternoon, Evening With Time
    String greeting = '';
    final DateTime now = DateTime.now();
    final int hour = now.hour;

    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }

    if (loginManager.role.value == "3") {
      avatar = "assets/images/person.png";
    } else if (loginManager.role.value == "2") {
      avatar = loginManager.avatarDoctor.value;
    }

    return Placeholder(
      child: Scaffold(
        backgroundColor: colorWhite,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              // For Picture
              Padding(
                padding: EdgeInsets.all(Get.height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Make Icon Appbar
                    InkWell(
                      onTap: () {
                        // make error getx snack bar
                        Get.showSnackbar(snackBarError("Fitur Belum Tersedia"));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: colorPrimary,
                          borderRadius: borderRadiusRectangle,
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: colorWhite,
                        ),
                      ),
                    ),
                    // Make Profile Picture Rectangle With Image
                    InkWell(
                      onTap: () {
                        // make error getx snack bar
                        Get.to(() => const Profile());
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: colorPrimary,
                          borderRadius: borderRadiusRectangle,
                          image: DecorationImage(
                            image: AssetImage(avatar),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.001,
              ),
              // For Greeting and Name
              Padding(
                padding: EdgeInsets.all(Get.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, $greeting',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: colorGrayDark),
                    ),
                    // Make Text With Name
                    Text(
                      loginManager.name.value,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: colorPrimary, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              // Make Container With Decoration Color Primary
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.01, horizontal: Get.height * 0.02),
                child: Container(
                  height: Get.height * 0.23,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: colorPrimary,
                    borderRadius: borderRadiusRectangle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorPrimary,
                        colorPrimaryDark,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.02, horizontal: Get.height * 0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: colorWhite,
                            ),
                            Text("Makassar, Indonesia", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorWhite)),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text("Find The Doctor Nearest To Your Location", style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: colorWhite, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        // Make Search Bar
                        InkWell(
                          onTap: () {
                            Get.to(() => const doctor_screen.Doctor());
                          },
                          child: Container(
                            height: Get.height * 0.05,
                            width: Get.width,
                            decoration: const BoxDecoration(
                              color: colorWhite,
                              borderRadius: borderRadiusRectangle,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                const Icon(
                                  Icons.search,
                                  color: colorPrimary,
                                ),
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                Text("Search", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorPrimary)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Get.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Category", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: colorPrimary, fontWeight: FontWeight.bold)),
                        InkWell(
                            onTap: () {
                              Get.to(const category_screen.Category());
                            },
                            child: Text("See All", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: colorGrayDark))),
                      ],
                    ),
                  ],
                ),
              ),
              // Make List View Builder
              SizedBox(
                height: 40,
                child: Obx(
                  () {
                    if (categoryManager.isCategoryLoading.value) {
                      return Column(
                        children: const [
                          Center(child: CircularProgressIndicator()),
                        ],
                      );
                    } else if (categoryManager.isCategoryError.value) {
                      return const Center(child: Text('Error'));
                    } else if (categoryManager.isCategoryEmpty.value) {
                      return Column(
                        children: [
                          Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                        ],
                      );
                    } else if (categoryManager.isCategorySuccess.value) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: categoryManager.category.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Category(
                                index: index,
                                categoryManager: categoryManager,
                              ),
                            );
                          } else {
                            return Category(
                              index: index,
                              categoryManager: categoryManager,
                            );
                          }
                        },
                      );
                    } else {
                      return Column(
                        children: const [
                          Center(child: CircularProgressIndicator()),
                        ],
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.all(Get.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Top Rated Doctor", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: colorPrimary, fontWeight: FontWeight.bold)),
                        InkWell(
                            onTap: () {
                              Get.to(const doctor_screen.Doctor());
                            },
                            child: Text("See All", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: colorGrayDark))),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: colorWhite,
                  borderRadius: borderRadiusRectangle,
                ),
                child: Obx(
                  () {
                    if (doctorManager.isDoctorLoading.value) {
                      return Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height / 50),
                          const Center(child: CircularProgressIndicator()),
                        ],
                      );
                    } else if (doctorManager.isDoctorError.value) {
                      return const Center(child: Text('Error'));
                    } else if (doctorManager.isDoctorEmpty.value) {
                      return Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height / 50),
                          SvgPicture.asset('assets/svg/not_found.svg', width: 150),
                          Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                        ],
                      );
                    } else if (doctorManager.isDoctorSuccess.value) {
                      return Transform.translate(
                        offset: Offset(0, Get.height * -0.04),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: doctorManager.doctor.length,
                          itemBuilder: (BuildContext context, int index) {
                            return doctor_component.Doctor(
                              index: index,
                              doctorManager: doctorManager,
                              rating: 2,
                            );
                          },
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height / 50),
                          const Center(child: CircularProgressIndicator()),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
