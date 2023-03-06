import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/customer_manager.dart';
import 'package:makassar_pet_clinic/services/customer_service.dart';

class CustomerController extends GetxController {
  late final CustomerService doctorService;
  late final CustomerManager doctorManager;

  @override
  void onInit() {
    doctorService = Get.put(CustomerService());
    doctorManager = Get.put(CustomerManager());
    super.onInit();
  }

  Future<void> getCustomerByIdUser(int idUser) async {
    final response = await doctorService.getCustomerByIdUser(idUser);
    if (response == null) {
      doctorManager.saveCustomer(null);
    } else {
      doctorManager.saveCustomer(response);
    }
  }
}
