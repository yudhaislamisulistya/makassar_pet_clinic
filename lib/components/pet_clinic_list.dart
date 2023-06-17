import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/pet_clinic_controller.dart';
import 'package:makassar_pet_clinic/main.dart';

class PetClinicList extends StatelessWidget {
  final int index;
  final dynamic petClinicManager;
  const PetClinicList({super.key, required this.index, this.petClinicManager});

  @override
  Widget build(BuildContext context) {
    final PetClinicController petClinicController = Get.put(PetClinicController());

    TextEditingController clinicNameController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController websiteController = TextEditingController();
    TextEditingController operatingHoursController = TextEditingController();
    TextEditingController servicesOfferedController = TextEditingController();
    TextEditingController facilitiesController = TextEditingController();

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
          child: Icon(Icons.cleaning_services),
        ),
        title: Text(petClinicManager.petClinic[index].clinicName ?? '', style: Theme.of(context).textTheme.titleLarge),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(petClinicManager.petClinic[index].address ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petClinicManager.petClinic[index].phone ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petClinicManager.petClinic[index].email ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petClinicManager.petClinic[index].website ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petClinicManager.petClinic[index].operatingHours ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petClinicManager.petClinic[index].servicesOffered ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petClinicManager.petClinic[index].facilities ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
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
                      title: 'Delete Pet Klinik',
                      middleText: 'Are you sure want to delete this Pet Klinik?',
                      textConfirm: 'Yes',
                      textCancel: 'No',
                      confirmTextColor: Colors.white,
                      cancelTextColor: colorError,
                      buttonColor: colorError,
                      onConfirm: () {
                        petClinicController.deletePetClinic(petClinicManager.petClinic[index].id);
                      },
                    );
                  },
                  child: const Icon(Icons.delete, size: 15),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    clinicNameController.text = petClinicManager.petClinic[index].clinicName ?? '';
                    locationController.text = petClinicManager.petClinic[index].address ?? '';
                    phoneController.text = petClinicManager.petClinic[index].phone ?? '';
                    addressController.text = petClinicManager.petClinic[index].address ?? '';
                    emailController.text = petClinicManager.petClinic[index].email ?? '';
                    websiteController.text = petClinicManager.petClinic[index].website ?? '';
                    operatingHoursController.text = petClinicManager.petClinic[index].operatingHours ?? '';
                    servicesOfferedController.text = petClinicManager.petClinic[index].servicesOffered ?? '';
                    facilitiesController.text = petClinicManager.petClinic[index].facilities ?? '';
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
                                Text('Update Pet Klinik', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    // controller: nameController,
                                    controller: clinicNameController,
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: facilitiesController,
                                    decoration: InputDecoration(
                                      hintText: 'Facilities',
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
                                    if (clinicNameController.text.isEmpty) {
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
                                    } else if (facilitiesController.text.isEmpty) {
                                      Get.back();
                                      Get.showSnackbar(snackBarError("Facilities is required"));
                                      return;
                                    } else {
                                      petClinicController.updatePetClinic(
                                        petClinicManager.petClinic[index].id,
                                        clinicNameController.text,
                                        locationController.text,
                                        phoneController.text,
                                        addressController.text,
                                        emailController.text,
                                        websiteController.text,
                                        operatingHoursController.text,
                                        servicesOfferedController.text,
                                        facilitiesController.text,
                                      );

                                      clinicNameController.clear();
                                      locationController.clear();
                                      phoneController.clear();
                                      addressController.clear();
                                      emailController.clear();
                                      websiteController.clear();
                                      operatingHoursController.clear();
                                      servicesOfferedController.clear();
                                      facilitiesController.clear();
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
