import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/components/doctor.dart' as doctor_component;
import 'package:makassar_pet_clinic/components/customer.dart' as customer_component;
import 'package:makassar_pet_clinic/controllers/customer_controller.dart';
import 'package:makassar_pet_clinic/controllers/user_controller.dart';
import 'package:makassar_pet_clinic/cores/customer_manager.dart';
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
  final UserController userController = Get.put(UserController());

  TextEditingController nameCustomerController = TextEditingController();
  TextEditingController emailCustomerController = TextEditingController();
  TextEditingController addressCustomerController = TextEditingController();
  TextEditingController phoneCustomerController = TextEditingController();
  TextEditingController petTypeCustomerController = TextEditingController();
  TextEditingController petNameCustomerController = TextEditingController();
  TextEditingController petAgeCustomerController = TextEditingController();
  TextEditingController petGenderCustomerController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                              Text('Add Customer', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
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
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                    hintText: 'Username',
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
                                  obscureText: true,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
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
                                    await customerController.addCustomer(
                                      nameCustomerController.text,
                                      emailCustomerController.text,
                                      addressCustomerController.text,
                                      phoneCustomerController.text,
                                      petTypeCustomerController.text,
                                      petNameCustomerController.text,
                                      petAgeCustomerController.text,
                                      petGenderCustomerController.text,
                                    );

                                    await userController.addUser(
                                      nameCustomerController.text,
                                      usernameController.text,
                                      passwordController.text,
                                      '3',
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
                                    usernameController.clear();
                                    passwordController.clear();
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
                        return customer_component.Customer(
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
