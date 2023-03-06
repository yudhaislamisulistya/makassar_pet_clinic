import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/doctor_controller.dart';
import 'package:makassar_pet_clinic/controllers/information_controller.dart';
import 'package:makassar_pet_clinic/cores/doctor_manager.dart';

import 'package:makassar_pet_clinic/components/doctor.dart' as doctor_component;
import 'package:makassar_pet_clinic/components/information.dart' as information_component;
import 'package:makassar_pet_clinic/cores/information_manager.dart';

class DetailCategory extends StatefulWidget {
  final String? name;
  const DetailCategory({super.key, this.name});

  @override
  State<DetailCategory> createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final DoctorController doctorController = Get.put(DoctorController());
  final DoctorManager doctorManager = Get.put(DoctorManager());
  final InformationController informationController = Get.put(InformationController());
  final InformationManager informationManager = Get.put(InformationManager());

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Future.delayed(Duration.zero, () {
      doctorManager.doctor.clear();
      doctorController.getDoctor();
      informationManager.information.clear();
      informationController.getInformationWithFilter(widget.name ?? '');
      categoryController.text = widget.name ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          title: Text(widget.name ?? "-", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)),
          centerTitle: true,
          iconTheme: const IconThemeData(color: colorWhite),
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  colorPrimary,
                  colorPrimaryDark,
                ],
              ),
            ),
          ),
          bottom: TabBar(
            indicatorColor: colorWhite,
            labelColor: colorWhite,
            controller: _tabController,
            tabs: const <Tab>[
              Tab(text: 'Doctor'),
              Tab(text: 'Information'),
            ],
          ),
          actions: [
            // Add Button Add Information
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10),
                            Container(
                              width: 50,
                              height: 5,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('Add Information', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                  hintStyle: const TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            // Make TextField for description
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: descriptionController,
                                decoration: InputDecoration(
                                  hintText: 'Description',
                                  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                  hintStyle: const TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: categoryController,
                                decoration: InputDecoration(
                                  hintText: 'Category',
                                  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                  hintStyle: const TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            // Make DropdownButton for avatar
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () async {
                                if (nameController.text.isEmpty) {
                                  Get.back();
                                  Get.showSnackbar(snackBarError("Name is required"));
                                  return;
                                } else if (descriptionController.text.isEmpty) {
                                  Get.back();
                                  Get.showSnackbar(snackBarError("Description is required"));
                                  return;
                                } else if (categoryController.text.isEmpty) {
                                  Get.back();
                                  Get.showSnackbar(snackBarError("Category is required"));
                                  return;
                                } else {
                                  informationController.addInformation(
                                    nameController.text,
                                    descriptionController.text,
                                    categoryController.text,
                                  );

                                  nameController.clear();
                                  descriptionController.clear();
                                  categoryController.clear();
                                }
                              },
                              child: Text('Save', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Obx(
                    () {
                      if (doctorManager.isDoctorLoading.value) {
                        return Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height / 4),
                            const Center(child: CircularProgressIndicator()),
                          ],
                        );
                      } else if (doctorManager.isDoctorError.value) {
                        return const Center(child: Text('Error'));
                      } else if (doctorManager.isDoctorEmpty.value) {
                        return Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height / 4),
                            SvgPicture.asset('assets/svg/not_found.svg', width: 300),
                            Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                          ],
                        );
                      } else if (doctorManager.isDoctorSuccess.value) {
                        return ListView.builder(
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
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Obx(
                    () {
                      if (informationManager.isInformationLoading.value) {
                        return Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height / 4),
                            const Center(child: CircularProgressIndicator()),
                          ],
                        );
                      } else if (informationManager.isInformationError.value) {
                        return const Center(child: Text('Error'));
                      } else if (informationManager.isInformationEmpty.value) {
                        return Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height / 4),
                            SvgPicture.asset('assets/svg/not_found.svg', width: 300),
                            Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                          ],
                        );
                      } else if (informationManager.isInformationSuccess.value) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: informationManager.information.length,
                          itemBuilder: (BuildContext context, int index) {
                            return information_component.Information(
                              index: index,
                              informationManager: informationManager,
                            );
                          },
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
