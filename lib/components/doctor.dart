// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/doctor_controller.dart';
import 'package:makassar_pet_clinic/screens/details/detail_doctor.dart';

class Doctor extends StatelessWidget {
  final int index;
  final dynamic doctorManager;
  final num rating;
  const Doctor({super.key, required this.index, required this.doctorManager, required this.rating});

  @override
  Widget build(BuildContext context) {
    final DoctorController doctorController = Get.put(DoctorController());

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController specializationController = TextEditingController();
    TextEditingController experienceYearsController = TextEditingController();
    TextEditingController aboutController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    String? selectedAvatar = "Avatar 1";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        color: colorWhite,
        borderRadius: borderRadiusRectangle,
        boxShadow: [
          BoxShadow(
            color: colorGrayLight,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          dense: true,
          isThreeLine: true,
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: colorPrimary,
              borderRadius: borderRadiusRectangle,
              image: DecorationImage(
                image: AssetImage(doctorManager.doctor[index].avatar == "-" ? 'assets/images/doctor1.jpeg' : doctorManager.doctor[index].avatar),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(doctorManager.doctor[index].name ?? '-', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorPrimary, fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doctorManager.doctor[index].specialization ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorGrayDark)),
              // Give Star Rating With Icon and condition
              Row(
                children: [
                  // if rating is null, show 0 star
                  if (rating != null) ...[
                    for (var i = 0; i < rating; i++)
                      const Icon(
                        Icons.star,
                        color: colorPrimary,
                        size: 15,
                      ),
                    // if rating is not null, show star rating
                  ]
                ],
              )
            ],
          ),
          trailing: SizedBox(
            width: 150,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(
                      DetailDoctor(),
                    );
                  },
                  child: const Icon(Icons.arrow_forward_ios, size: 15),
                ),
                const SizedBox(width: 8),
                InkWell(
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Delete Doctor',
                        middleText: 'Are you sure want to delete this category?',
                        textConfirm: 'Yes',
                        textCancel: 'No',
                        confirmTextColor: Colors.white,
                        cancelTextColor: colorError,
                        buttonColor: colorError,
                        onConfirm: () {
                          doctorController.deleteDoctor(doctorManager.doctor[index].id!);
                        },
                      );
                    },
                    child: const Icon(Icons.delete, size: 15)),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    // make bottom sheet for edit category
                    nameController.text = doctorManager.doctor[index].name!;
                    emailController.text = doctorManager.doctor[index].email!;
                    specializationController.text = doctorManager.doctor[index].specialization!;
                    experienceYearsController.text = doctorManager.doctor[index].experienceYears!;
                    aboutController.text = doctorManager.doctor[index].about!;
                    phoneController.text = doctorManager.doctor[index].phone!;
                    addressController.text = doctorManager.doctor[index].address!;

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
                                Text('Update Doctor', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: 'Doctor Name',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      hintStyle: const TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                // Email
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
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
                                // Specialization
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: specializationController,
                                    decoration: InputDecoration(
                                      hintText: 'Specialization',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      hintStyle: const TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                // Experience Years
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: experienceYearsController,
                                    decoration: InputDecoration(
                                      hintText: 'Experience Years',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      hintStyle: const TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                // About
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: aboutController,
                                    decoration: InputDecoration(
                                      hintText: 'About',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      hintStyle: const TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                // Phone
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    keyboardType: TextInputType.phone,
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
                                // Avatar
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonFormField<String>(
                                    value: selectedAvatar, // nilai awal dropdown
                                    decoration: InputDecoration(
                                      hintText: 'Avatar',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      hintStyle: const TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    items: <String>[
                                      'Avatar 1',
                                      'Avatar 2',
                                      'Avatar 3',
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      selectedAvatar = newValue!;
                                    },
                                  ),
                                ),
                                // Address
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
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    if (nameController.text.isEmpty) {
                                      Get.snackbar('Error', 'Doctor Name is required');
                                    } else if (emailController.text.isEmpty) {
                                      Get.snackbar('Error', 'Email is required');
                                    } else if (specializationController.text.isEmpty) {
                                      Get.snackbar('Error', 'Specialization is required');
                                    } else if (experienceYearsController.text.isEmpty) {
                                      Get.snackbar('Error', 'Experience Years is required');
                                    } else if (aboutController.text.isEmpty) {
                                      Get.snackbar('Error', 'About is required');
                                    } else if (phoneController.text.isEmpty) {
                                      Get.snackbar('Error', 'Phone is required');
                                    } else if (addressController.text.isEmpty) {
                                      Get.snackbar('Error', 'Address is required');
                                    } else {
                                      doctorController.updateDoctor(
                                        doctorManager.doctor[index].id,
                                        nameController.text,
                                        emailController.text,
                                        specializationController.text,
                                        experienceYearsController.text,
                                        aboutController.text,
                                        phoneController.text,
                                        selectedAvatar!,
                                        addressController.text,
                                      );

                                      // Clear input controller
                                      nameController.clear();
                                      emailController.clear();
                                      specializationController.clear();
                                      experienceYearsController.clear();
                                      aboutController.clear();
                                      phoneController.clear();
                                      addressController.clear();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
