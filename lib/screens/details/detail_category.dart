import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/doctor_controller.dart';
import 'package:makassar_pet_clinic/cores/doctor_manager.dart';

import 'package:makassar_pet_clinic/components/doctor.dart' as doctor_component;

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
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
            Center(child: Text('Information')),
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
