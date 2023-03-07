import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/customer_manager.dart';
import 'package:makassar_pet_clinic/models/customer/customer_request_model.dart';
import 'package:makassar_pet_clinic/screens/login.dart';
import 'package:makassar_pet_clinic/services/customer_service.dart';

class CustomerController extends GetxController {
  late final CustomerService customerService;
  late final CustomerManager customerManager;

  @override
  void onInit() {
    customerService = Get.put(CustomerService());
    customerManager = Get.put(CustomerManager());
    super.onInit();
  }

  Future<void> getCustomer() async {
    final response = await customerService.getDoctor();
    if (response == null) {
      Get.showSnackbar(snackBarError("Gagal Mendapatkan Dokter"));
      customerManager.saveCustomer(null);
    } else {
      customerManager.saveCustomer(response);
    }
  }

  Future<void> getCustomerByIdUser(int idUser) async {
    final response = await customerService.getCustomerByIdUser(idUser);
    if (response == null) {
      customerManager.saveCustomer(null);
    } else {
      customerManager.saveCustomer(response);
    }
  }

  Future<void> updateCustomer(int id, String name, String phone, String address, String petType, String petName, String petAge, String petGender) async {
    final response = await customerService.updateCustomer(CustomerRequestModel(
      id: id,
      name: name,
      phone: phone,
      address: address,
      petType: petType,
      petName: petName,
      petAge: petAge,
      petGender: petGender,
    ));
    if (response != null) {
      Get.showSnackbar(snackBarSuccessWithAction("Berhasil Mengupdate Profile Customer, Silahkan tekan tombol OK untuk kembali ke halaman login"));
    } else {
      Get.showSnackbar(snackBarError("Gagal Mengupdate Profile Customer"));
    }
  }
}
