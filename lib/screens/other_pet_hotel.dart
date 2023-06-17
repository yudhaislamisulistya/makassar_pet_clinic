import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/components/pet_hotel_list.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/pet_hotel_controller.dart';
import 'package:makassar_pet_clinic/cores/pet_hotel_manager.dart';

class OtherPetHotel extends StatefulWidget {
  const OtherPetHotel({super.key});

  @override
  State<OtherPetHotel> createState() => _OtherPetHotelState();
}

class _OtherPetHotelState extends State<OtherPetHotel> with SingleTickerProviderStateMixin {
  final PetHotelController petHotelController = Get.put(PetHotelController());
  final PetHotelManager petHotelManager = Get.put(PetHotelManager());

  TextEditingController hotelNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController operatingHoursController = TextEditingController();
  TextEditingController checkInTimeController = TextEditingController();
  TextEditingController checkOutTimeController = TextEditingController();
  TextEditingController servicesOfferedController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      petHotelManager.petHotel.clear();
      petHotelController.getPetHotel();
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
          'Informasi Lainnya Pet Hotel',
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
                              controller: hotelNameController,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              // controller: nameController,
                              controller: addressController,
                              decoration: InputDecoration(
                                hintText: 'Address',
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
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'Email',
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
                              controller: websiteController,
                              decoration: InputDecoration(
                                hintText: 'Website',
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
                              controller: operatingHoursController,
                              decoration: InputDecoration(
                                hintText: 'Operating Hours',
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
                              controller: checkInTimeController,
                              decoration: InputDecoration(
                                hintText: 'Check In Time',
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
                              controller: checkOutTimeController,
                              decoration: InputDecoration(
                                hintText: 'Check Out Time',
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
                              controller: servicesOfferedController,
                              decoration: InputDecoration(
                                hintText: 'Services Offered',
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
                              if (hotelNameController.text.isEmpty) {
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
                              } else if (addressController.text.isEmpty) {
                                Get.back();
                                Get.showSnackbar(snackBarError("Address is required"));
                                return;
                              } else if (emailController.text.isEmpty) {
                                Get.back();
                                Get.showSnackbar(snackBarError("Email is required"));
                                return;
                              } else if (websiteController.text.isEmpty) {
                                Get.back();
                                Get.showSnackbar(snackBarError("Website is required"));
                                return;
                              } else if (operatingHoursController.text.isEmpty) {
                                Get.back();
                                Get.showSnackbar(snackBarError("Operating Hours is required"));
                                return;
                              } else if (servicesOfferedController.text.isEmpty) {
                                Get.back();
                                Get.showSnackbar(snackBarError("Services Offered is required"));
                                return;
                              } else if (checkInTimeController.text.isEmpty) {
                                Get.back();
                                Get.showSnackbar(snackBarError("Check In is required"));
                                return;
                              } else if (checkOutTimeController.text.isEmpty) {
                                Get.back();
                                Get.showSnackbar(snackBarError("Check Out is required"));
                                return;
                              } else {
                                petHotelController.addPetHotel(
                                  hotelNameController.text,
                                  locationController.text,
                                  phoneController.text,
                                  addressController.text,
                                  emailController.text,
                                  websiteController.text,
                                  operatingHoursController.text,
                                  servicesOfferedController.text,
                                  checkInTimeController.text,
                                  checkOutTimeController.text,
                                );

                                hotelNameController.clear();
                                locationController.clear();
                                phoneController.clear();
                                addressController.clear();
                                emailController.clear();
                                websiteController.clear();
                                operatingHoursController.clear();
                                servicesOfferedController.clear();
                                checkInTimeController.clear();
                                checkOutTimeController.clear();
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
                if (petHotelManager.isPetHotelLoading.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (petHotelManager.isPetHotelError.value) {
                  return const Center(child: Text('Error'));
                } else if (petHotelManager.isPetHotelEmpty.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      SvgPicture.asset('assets/svg/not_found.svg', width: 300),
                      Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                    ],
                  );
                } else if (petHotelManager.isPetHotelSuccess.value) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: petHotelManager.petHotel.length,
                    itemBuilder: (context, index) {
                      return PetHotelList(index: index, petHotelManager: petHotelManager);
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
