import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/components/doctor.dart' as doctor_component;
import 'package:makassar_pet_clinic/controllers/customer_controller.dart';
import 'package:makassar_pet_clinic/controllers/doctor_controller.dart';
import 'package:makassar_pet_clinic/cores/customer_manager.dart';
import 'package:makassar_pet_clinic/cores/doctor_manager.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';

class Customer extends StatefulWidget {
  const Customer({super.key});

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  final CustomerController customerController = Get.put(CustomerController());
  final CustomerManager customerManager = Get.put(CustomerManager());
  final LoginManager loginManager = Get.put(LoginManager());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController experienceYearsController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String? selectedAvatar = "Avatar 1";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      customerManager.customer.clear();
      customerController.getCustomer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text('Customer', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          elevation: 0,
          actions: <Widget>[
            // Make Button Search
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(customerManager),
                  useRootNavigator: true,
                );
              },
            ),
            if (loginManager.role.value == '1') ...[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  // Make Bottom Sheet
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
                              Text('Add Doctor', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
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
                                    setState(() {
                                      selectedAvatar = newValue!;
                                    });
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
                                onPressed: () async {
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
                                    // await doctorController.addDoctor(
                                    //   nameController.text,
                                    //   emailController.text,
                                    //   specializationController.text,
                                    //   int.parse(experienceYearsController.text),
                                    //   aboutController.text,
                                    //   phoneController.text,
                                    //   selectedAvatar!,
                                    //   addressController.text,
                                    // );

                                    // // Clear input controller
                                    // nameController.clear();
                                    // emailController.clear();
                                    // specializationController.clear();
                                    // experienceYearsController.clear();
                                    // aboutController.clear();
                                    // phoneController.clear();
                                    // addressController.clear();
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
            ]
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () {
                  if (customerManager.isCustomerLoading.value) {
                    return Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height / 4),
                        const Center(child: CircularProgressIndicator()),
                      ],
                    );
                  } else if (customerManager.isCustomerError.value) {
                    return const Center(child: Text('Error'));
                  } else if (customerManager.isCustomerEmpty.value) {
                    return Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height / 4),
                        SvgPicture.asset('assets/svg/not_found.svg', width: 300),
                        Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                      ],
                    );
                  } else if (customerManager.isCustomerSuccess.value) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: customerManager.customer.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(title: Text("Selamat Datang"));
                        // return doctor_component.Doctor(
                        //   index: index,
                        //   customerManager: customerManager,
                        //   rating: 2,
                        // );
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
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate<String> {
  final CustomerManager customerManager;
  MySearchDelegate(this.customerManager);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    dynamic doctor;
    if (query.isEmpty) {
      doctor = [];
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 4),
            SvgPicture.asset('assets/svg/not_found.svg', width: 300),
            Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
          ],
        ),
      );
    } else {
      doctor = customerManager.customer.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
      return SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                if (customerManager.isCustomerLoading.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (customerManager.isCustomerError.value) {
                  return const Center(child: Text('Error'));
                } else if (customerManager.isCustomerEmpty.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      SvgPicture.asset('assets/svg/not_found.svg', width: 300),
                      Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                    ],
                  );
                } else if (customerManager.isCustomerSuccess.value) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: doctor.length,
                    itemBuilder: (BuildContext context, int index) {
                      return doctor_component.Doctor(
                        index: index,
                        doctorManager: customerManager,
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
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    dynamic doctor;
    if (query.isEmpty) {
      doctor = [];
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 4),
            SvgPicture.asset('assets/svg/not_found.svg', width: 300),
            Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
          ],
        ),
      );
    } else {
      doctor = customerManager.customer.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
      return SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                if (customerManager.isCustomerLoading.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (customerManager.isCustomerError.value) {
                  return const Center(child: Text('Error'));
                } else if (customerManager.isCustomerEmpty.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      SvgPicture.asset('assets/svg/not_found.svg', width: 300),
                      Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                    ],
                  );
                } else if (customerManager.isCustomerSuccess.value) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: doctor.length,
                    itemBuilder: (BuildContext context, int index) {
                      return doctor_component.Doctor(
                        index: index,
                        doctorManager: customerManager,
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
      );
    }
  }
}
