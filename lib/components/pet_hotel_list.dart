import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/pet_hotel_controller.dart';
import 'package:makassar_pet_clinic/main.dart';

class PetHotelList extends StatelessWidget {
  final int index;
  final dynamic petHotelManager;
  const PetHotelList({super.key, required this.index, this.petHotelManager});

  @override
  Widget build(BuildContext context) {
    final PetHotelController petHotelController = Get.put(PetHotelController());

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
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: colorPrimaryLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Container(
          height: double.infinity,
          child: Icon(Icons.hotel),
        ),
        title: Text(petHotelManager.petHotel[index].hotelName ?? '', style: Theme.of(context).textTheme.titleLarge),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(petHotelManager.petHotel[index].address ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotelManager.petHotel[index].phone ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotelManager.petHotel[index].email ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotelManager.petHotel[index].website ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotelManager.petHotel[index].operatingHours ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotelManager.petHotel[index].servicesOffered ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotelManager.petHotel[index].checkInTime ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotelManager.petHotel[index].checkOutTime ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
          ],
        ),
        trailing: SizedBox(
          width: 150,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (loginManager.role.value == "1") ...[
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: 'Delete Pet Hotel',
                      middleText: 'Are you sure want to delete this Pet Hotel?',
                      textConfirm: 'Yes',
                      textCancel: 'No',
                      confirmTextColor: Colors.white,
                      cancelTextColor: colorError,
                      buttonColor: colorError,
                      onConfirm: () {
                        petHotelController.deletePetHotel(petHotelManager.petHotel[index].id);
                      },
                    );
                  },
                  child: const Icon(Icons.delete, size: 15),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    hotelNameController.text = petHotelManager.petHotel[index].hotelName ?? '';
                    locationController.text = petHotelManager.petHotel[index].address ?? '';
                    phoneController.text = petHotelManager.petHotel[index].phone ?? '';
                    addressController.text = petHotelManager.petHotel[index].address ?? '';
                    emailController.text = petHotelManager.petHotel[index].email ?? '';
                    websiteController.text = petHotelManager.petHotel[index].website ?? '';
                    operatingHoursController.text = petHotelManager.petHotel[index].operatingHours ?? '';
                    servicesOfferedController.text = petHotelManager.petHotel[index].servicesOffered ?? '';
                    checkInTimeController.text = petHotelManager.petHotel[index].checkInTime ?? '';
                    checkOutTimeController.text = petHotelManager.petHotel[index].checkOutTime ?? '';
                    showModalBottomSheet(
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
                                Text('Update Pet Hotel', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
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
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
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
                                      petHotelController.updatePetHotel(
                                        petHotelManager.petHotel[index].id,
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
                                  child: Text('Update', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.edit, size: 15),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
