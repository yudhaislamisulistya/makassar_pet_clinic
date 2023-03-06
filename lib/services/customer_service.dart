import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/customer/customer_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomerService extends GetConnect {
  final supabase = Supabase.instance.client;

  Future<CustomerResponseModel?> getCustomerByIdUser(int idUser) async {
    // Get Customer by idUser
    final response = await supabase.from('customers').select().eq('id_user', idUser);

    if (response.isEmpty) {
      return null;
    } else {
      return CustomerResponseModel.fromJson(response);
    }
  }
}
