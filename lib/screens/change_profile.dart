// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/customer_controller.dart';
import 'package:makassar_pet_clinic/controllers/doctor_controller.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({super.key});

  @override
  State<ChangeProfile> createState() => ChangeProfileState();
}

class ChangeProfileState extends State<ChangeProfile> {
  final LoginManager loginManager = Get.put(LoginManager());
  final CustomerController customerController = Get.put(CustomerController());
  final DoctorController doctorController = Get.put(DoctorController());
  late String name = '';
  late String email = '';
  late String avatar = 'assets/images/person.png';
  String? selectedAvatar = "Avatar 1";

  TextEditingController nameCustomerController = TextEditingController();
  TextEditingController emailCustomerControllerCustomer = TextEditingController();
  TextEditingController addressCustomerController = TextEditingController();
  TextEditingController phoneCustomerController = TextEditingController();
  TextEditingController petTypeCustomerController = TextEditingController();
  TextEditingController petNameCustomerController = TextEditingController();
  TextEditingController petAgeCustomerController = TextEditingController();
  TextEditingController petGenderCustomerController = TextEditingController();

  TextEditingController nameDoctorController = TextEditingController();
  TextEditingController emailDoctorController = TextEditingController();
  TextEditingController addressDoctorController = TextEditingController();
  TextEditingController phoneDoctorController = TextEditingController();
  TextEditingController specializationDoctorController = TextEditingController();
  TextEditingController experienceDoctorController = TextEditingController();
  TextEditingController aboutDoctorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    asyncMethod();
  }

  void asyncMethod() async {
    Future.delayed(const Duration(milliseconds: 500), () {
      loginManager.setUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loginManager.role.value == "3") {
      name = loginManager.nameCustomer.value;
      email = loginManager.emailCustomer.value;
      avatar = 'assets/images/person.png';
    } else if (loginManager.role.value == "2") {
      name = loginManager.nameDoctor.value;
      email = loginManager.emailDoctor.value;
      avatar = loginManager.avatarDoctor.value;
    }
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(),
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: colorPrimary,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Obx(
                () {
                  if (loginManager.isAuthenticated.value) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            width: Get.width,
                            color: colorPrimary,
                            child: SvgPicture.asset(
                              'assets/svg/header_two.svg',
                              width: Get.width,
                              height: Get.height * 0.2,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          height: Get.height * 0.2,
                          width: Get.width,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                colorPrimary,
                                colorPrimaryLight,
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25.0),
                              bottomRight: Radius.circular(25.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(3), // Border radius
                                  child: ClipOval(
                                    child: Image.asset(
                                      avatar,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                email,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

              const SizedBox(
                height: 20,
              ),
              // make listile logout
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Pengaturan',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (loginManager.role.value == "3") ...[
                      InputTextField(
                        controller: nameCustomerController,
                        hintText: 'Masukkan Nama',
                        value: loginManager.nameCustomer.value,
                        disabledInput: true,
                      ),
                      InputTextField(
                        controller: emailCustomerControllerCustomer,
                        hintText: 'Masukkan Email',
                        value: loginManager.emailCustomer.value,
                        disabledInput: false,
                      ),
                      InputTextField(
                        controller: addressCustomerController,
                        hintText: 'Masukkan Alamat',
                        value: loginManager.addressCustomer.value,
                        disabledInput: true,
                      ),
                      InputTextField(
                        controller: phoneCustomerController,
                        hintText: 'Masukkan Nomor Telepon',
                        value: loginManager.phoneCustomer.value,
                        disabledInput: true,
                      ),
                      InputTextField(
                        controller: petTypeCustomerController,
                        hintText: 'Masukkan Jenis Hewan',
                        value: loginManager.petType.value,
                        disabledInput: true,
                      ),
                      InputTextField(
                        controller: petNameCustomerController,
                        hintText: 'Masukkan Nama Hewan',
                        value: loginManager.petName.value,
                        disabledInput: true,
                      ),
                      InputTextField(
                        controller: petAgeCustomerController,
                        hintText: 'Masukkan Umur Hewan',
                        value: loginManager.petAge.value,
                        disabledInput: true,
                      ),
                      InputTextField(
                        controller: petGenderCustomerController,
                        hintText: 'Masukkan Jenis Kelamin Hewan',
                        value: loginManager.petGender.value,
                        disabledInput: true,
                      ),
                    ] else if (loginManager.role.value == "2") ...[
                      InputTextField(
                        controller: nameDoctorController,
                        hintText: 'Masukkan Nama',
                        value: loginManager.nameDoctor.value,
                        disabledInput: true,
                      ),
                      InputTextField(
                        controller: emailDoctorController,
                        hintText: 'Masukkan Email',
                        value: loginManager.emailDoctor.value,
                        disabledInput: false,
                      ),
                      InputTextField(
                        controller: addressDoctorController,
                        hintText: 'Masukkan Alamat',
                        value: loginManager.addressDoctor.value,
                        disabledInput: true,
                      ),
                      InputTextField(
                        controller: phoneDoctorController,
                        hintText: 'Masukkan Nomor Telepon',
                        value: loginManager.phoneDoctor.value,
                        disabledInput: true,
                      ),
                      InputTextField(
                        controller: specializationDoctorController,
                        hintText: 'Masukkan Spesialisasi',
                        value: loginManager.specializationDoctor.value,
                        disabledInput: true,
                      ),
                      DropdownButtonFormField<String>(
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
                          setState(() {
                            selectedAvatar = newValue!;
                          });
                        },
                      ),
                    ],

                    const SizedBox(
                      height: 20,
                    ),
                    // make button save
                    SizedBox(
                      width: Get.width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (loginManager.role.value == "3") {
                            if (nameCustomerController.text.isEmpty) {
                              Get.showSnackbar(snackBarError('Nama tidak boleh kosong'));
                            } else if (emailCustomerControllerCustomer.text.isEmpty) {
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
                              customerController.updateCustomer(
                                int.parse(loginManager.idCustomer.value),
                                nameCustomerController.text,
                                addressCustomerController.text,
                                phoneCustomerController.text,
                                petTypeCustomerController.text,
                                petNameCustomerController.text,
                                petAgeCustomerController.text,
                                petGenderCustomerController.text,
                              );
                            }
                          } else if (loginManager.role.value == "2") {
                            if (nameDoctorController.text.isEmpty) {
                              Get.showSnackbar(snackBarError('Nama tidak boleh kosong'));
                            } else if (emailDoctorController.text.isEmpty) {
                              Get.showSnackbar(snackBarError('Email tidak boleh kosong'));
                            } else if (addressDoctorController.text.isEmpty) {
                              Get.showSnackbar(snackBarError('Alamat tidak boleh kosong'));
                            } else if (phoneDoctorController.text.isEmpty) {
                              Get.showSnackbar(snackBarError('Nomor Telepon tidak boleh kosong'));
                            } else if (specializationDoctorController.text.isEmpty) {
                              Get.showSnackbar(snackBarError('Spesialisasi tidak boleh kosong'));
                            } else {
                              doctorController.updateDoctor(
                                int.parse(loginManager.idExpert.value),
                                nameDoctorController.text,
                                emailDoctorController.text,
                                specializationDoctorController.text,
                                experienceDoctorController.text,
                                aboutDoctorController.text,
                                phoneDoctorController.text,
                                selectedAvatar!,
                                addressDoctorController.text,
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Simpan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.value,
    required this.disabledInput,
  });

  final TextEditingController controller;
  final String hintText;
  final String value;
  final bool disabledInput;

  @override
  Widget build(BuildContext context) {
    controller.text = value;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          // make disabled input
          enabled: disabledInput,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
