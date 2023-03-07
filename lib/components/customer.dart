// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/customer_controller.dart';
import 'package:makassar_pet_clinic/controllers/doctor_controller.dart';
import 'package:makassar_pet_clinic/cores/customer_manager.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';
import 'package:makassar_pet_clinic/screens/details/detail_doctor.dart';

class Customer extends StatelessWidget {
  final int index;
  final dynamic doctorManager;
  final num rating;
  const Customer({super.key, required this.index, required this.doctorManager, required this.rating});

  @override
  Widget build(BuildContext context) {
    final CustomerManager customerManager = Get.put(CustomerManager());
    final CustomerController customerController = Get.put(CustomerController());
    final LoginManager loginManager = Get.put(LoginManager());

    TextEditingController nameCustomerController = TextEditingController();
    TextEditingController emailCustomerController = TextEditingController();
    TextEditingController addressCustomerController = TextEditingController();
    TextEditingController phoneCustomerController = TextEditingController();
    TextEditingController petTypeCustomerController = TextEditingController();
    TextEditingController petNameCustomerController = TextEditingController();
    TextEditingController petAgeCustomerController = TextEditingController();
    TextEditingController petGenderCustomerController = TextEditingController();
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
        child: Material(
          elevation: 0.20,
          shadowColor: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10.0),
          color: colorWhite,
          child: InkWell(
            highlightColor: colorPrimaryLight,
            onTap: () {},
            child: ListTile(
              dense: true,
              isThreeLine: true,
              leading: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: colorPrimary,
                  borderRadius: borderRadiusRectangle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/person.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(customerManager.customer[index].name ?? '-', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorPrimary, fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(customerManager.customer[index].petType ?? '-', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorGrayDark)),
                  Text(customerManager.customer[index].petName ?? '-', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorGrayDark)),
                  Text(customerManager.customer[index].petAge ?? '-', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorGrayDark)),
                  Text(customerManager.customer[index].petGender ?? '-', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorGrayDark)),
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
                              title: 'Delete Doctor',
                              middleText: 'Are you sure want to delete this category?',
                              textConfirm: 'Yes',
                              textCancel: 'No',
                              confirmTextColor: Colors.white,
                              cancelTextColor: colorError,
                              buttonColor: colorError,
                              onConfirm: () {
                                // doctorController.deleteDoctor(customerManager.customer[index].id!);
                              },
                            );
                          },
                          child: const Icon(Icons.delete, size: 15)),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          // make bottom sheet for edit category
                          nameCustomerController.text = customerManager.customer[index].name!;
                          emailCustomerController.text = customerManager.customer[index].email!;
                          addressCustomerController.text = customerManager.customer[index].address!;
                          phoneCustomerController.text = customerManager.customer[index].phone!;
                          petTypeCustomerController.text = customerManager.customer[index].petType!;
                          petNameCustomerController.text = customerManager.customer[index].petName!;
                          petAgeCustomerController.text = customerManager.customer[index].petAge!;
                          petGenderCustomerController.text = customerManager.customer[index].petGender!;

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
                                      Text('Update Customer', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: nameCustomerController,
                                          decoration: InputDecoration(
                                            hintText: 'Customer Name Name',
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
                                          controller: emailCustomerController,
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
                                          keyboardType: TextInputType.phone,
                                          controller: phoneCustomerController,
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
                                          controller: addressCustomerController,
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
                                          controller: petTypeCustomerController,
                                          decoration: InputDecoration(
                                            hintText: 'Pet Type',
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
                                          controller: petNameCustomerController,
                                          decoration: InputDecoration(
                                            hintText: 'Pet Name',
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
                                          controller: petAgeCustomerController,
                                          decoration: InputDecoration(
                                            hintText: 'Pet Age',
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
                                          controller: petGenderCustomerController,
                                          decoration: InputDecoration(
                                            hintText: 'Pet Gender',
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
                                        onPressed: () async {
                                          if (nameCustomerController.text.isEmpty) {
                                            Get.showSnackbar(snackBarError('Nama tidak boleh kosong'));
                                          } else if (emailCustomerController.text.isEmpty) {
                                            Get.showSnackbar(snackBarError('Email tidak boleh kosong'));
                                          } else if (addressCustomerController.text.isEmpty) {
                                            Get.showSnackbar(snackBarError('Alamat tidak boleh kosong'));
                                          } else if (phoneCustomerController.text.isEmpty) {
                                            Get.showSnackbar(snackBarError('Nomor Telepon tidak boleh kosong'));
                                          } else if (petTypeCustomerController.text.isEmpty) {
                                            Get.showSnackbar(snackBarError('Jenis Hewan tidak boleh kosong'));
                                          } else if (petNameCustomerController.text.isEmpty) {
                                            Get.showSnackbar(snackBarError('Nama Hewan tidak boleh kosong'));
                                          } else if (petAgeCustomerController.text.isEmpty) {
                                            Get.showSnackbar(snackBarError('Umur Hewan tidak boleh kosong'));
                                          } else if (petGenderCustomerController.text.isEmpty) {
                                            Get.showSnackbar(snackBarError('Jenis Kelamin Hewan tidak boleh kosong'));
                                          } else {
                                            await customerController.updateCustomer(
                                              customerManager.customer[index].id,
                                              nameCustomerController.text,
                                              addressCustomerController.text,
                                              phoneCustomerController.text,
                                              petTypeCustomerController.text,
                                              petNameCustomerController.text,
                                              petAgeCustomerController.text,
                                              petGenderCustomerController.text,
                                            );

                                            // Clear input controller
                                            nameCustomerController.clear();
                                            emailCustomerController.clear();
                                            addressCustomerController.clear();
                                            phoneCustomerController.clear();
                                            petTypeCustomerController.clear();
                                            petNameCustomerController.clear();
                                            petAgeCustomerController.clear();
                                            petGenderCustomerController.clear();
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
          ),
        ),
      ),
    );
  }
}
