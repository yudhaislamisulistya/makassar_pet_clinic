import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/components/pet_salon_list.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/pet_beauty_controller.dart';
import 'package:makassar_pet_clinic/cores/pet_beuaty_manager.dart';

class OtherPetBeauty extends StatefulWidget {
  const OtherPetBeauty({super.key});

  @override
  State<OtherPetBeauty> createState() => _OtherPetBeautyState();
}

class _OtherPetBeautyState extends State<OtherPetBeauty> with SingleTickerProviderStateMixin {
  final PetBeautyController petBeautyController = Get.put(PetBeautyController());
  final PetBeautyManager petBeautyManager = Get.put(PetBeautyManager());

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController serviceOfferedController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  TextEditingController serviceCostController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      petBeautyManager.petBeauty.clear();
      petBeautyController.getPetBeauty();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Informasi Lainnya Pet Salon',
          style: TextStyle(color: Colors.white),
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
                          Text('Add Pet Salon', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              // controller: nameController,
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
                              controller: locationController,
                              decoration: InputDecoration(
                                hintText: 'Location',
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
                              controller: phoneController,
                              decoration: InputDecoration(
                                hintText: 'Phone',
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
                              controller: serviceOfferedController,
                              decoration: InputDecoration(
                                hintText: 'Service Offered',
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
                              controller: ownerController,
                              decoration: InputDecoration(
                                hintText: 'Owner',
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
                              controller: serviceCostController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Service Cost',
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
                              } else if (locationController.text.isEmpty) {
                                Get.back();
                                Get.showSnackbar(snackBarError("Location is required"));
                                return;
                              } else if (phoneController.text.isEmpty) {
                                Get.back();
                                Get.showSnackbar(snackBarError("Phone is required"));
                                return;
                              } else if (serviceOfferedController.text.isEmpty) {
                                Get.back();
                                Get.showSnackbar(snackBarError("Service Offered is required"));
                                return;
                              } else if (ownerController.text.isEmpty) {
                                Get.back();
                                Get.showSnackbar(snackBarError("Owner is required"));
                                return;
                              } else if (serviceCostController.text.isEmpty) {
                                Get.back();
                                Get.showSnackbar(snackBarError("Service Cost is required"));
                                return;
                              } else {
                                petBeautyController.addPetBeauty(
                                  nameController.text,
                                  locationController.text,
                                  phoneController.text,
                                  serviceOfferedController.text,
                                  ownerController.text,
                                  serviceCostController.text,
                                );

                                nameController.clear();
                                locationController.clear();
                                serviceOfferedController.clear();
                                phoneController.clear();
                                ownerController.clear();
                                serviceCostController.clear();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                if (petBeautyManager.isPetBeautyLoading.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (petBeautyManager.isPetBeautyError.value) {
                  return const Center(child: Text('Error'));
                } else if (petBeautyManager.isPetBeautyEmpty.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      SvgPicture.asset('assets/svg/not_found.svg', width: 300),
                      Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                    ],
                  );
                } else if (petBeautyManager.isPetBeautySuccess.value) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: petBeautyManager.petBeauty.length,
                    itemBuilder: (context, index) {
                      return PetSalonList(
                        index: index,
                        petBeautyManager: petBeautyManager,
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
    );
  }
}
