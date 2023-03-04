// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/components/category.dart';
import 'package:makassar_pet_clinic/components/doctor.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/category_controller.dart';
import 'package:makassar_pet_clinic/cores/category_manager.dart';

import 'package:makassar_pet_clinic/screens/category.dart' as category_screen;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
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
                    Container(
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
                    // Make Profile Picture Rectangle With Image
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: colorPrimary,
                        borderRadius: borderRadiusRectangle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.jpg'),
                          fit: BoxFit.cover,
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
                      'Yudha Islami Sulistya',
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
                        Container(
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Get.height * 0.02),
                      child: const Category(
                        image: 'assets/images/pyschologist.png',
                        text: 'Pyschologist',
                      ),
                    ),
                    const Category(
                      image: 'assets/images/dentists.png',
                      text: 'Dentists',
                    ),
                    const Category(
                      image: 'assets/images/emergency.png',
                      text: 'Emergency',
                    ),
                  ],
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
                        Text("See All", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: colorGrayDark)),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: const [
                  Doctor(
                    image: 'assets/images/doctor1.jpeg',
                    name: 'Dr. Yudha Islami Sulistya',
                    specialist: 'Pyschologist',
                    rating: 3,
                  ),
                  Doctor(
                    image: 'assets/images/doctor2.jpeg',
                    name: 'Dr. Yudha Islami Sulistya',
                    specialist: 'Dentist',
                    rating: 5,
                  ),
                  Doctor(
                    image: 'assets/images/doctor3.jpeg',
                    name: 'Dr. Yudha Islami Sulistya',
                    specialist: 'Emergency',
                    rating: 5,
                  ),
                  Doctor(
                    image: 'assets/images/doctor3.jpeg',
                    name: 'Dr. Yudha Islami Sulistya',
                    specialist: 'Emergency',
                    rating: 5,
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
