import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/customer/customer_response_model.dart';

class CustomerManager extends GetxController {
  final isCustomerLoading = false.obs;
  final isCustomerError = false.obs;
  final isCustomerEmpty = false.obs;
  final isCustomerSuccess = false.obs;
  final customer = [].obs;

  Future<void> saveCustomer(CustomerResponseModel? data) async {
    isCustomerLoading.value = true;
    isCustomerError.value = false;
    isCustomerEmpty.value = false;
    isCustomerSuccess.value = false;

    try {
      if (data == null) {
        isCustomerEmpty.value = true;
      } else {
        customer.value = data.customers;
        isCustomerSuccess.value = true;
      }
    } catch (e) {
      isCustomerError.value = true;
    } finally {
      isCustomerLoading.value = false;
    }
  }
}
