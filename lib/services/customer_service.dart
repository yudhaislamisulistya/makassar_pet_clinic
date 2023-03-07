import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/customer/customer_request_model.dart';
import 'package:makassar_pet_clinic/models/customer/customer_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomerService extends GetConnect {
  final supabase = Supabase.instance.client;

  Future<CustomerResponseModel?> getDoctor() async {
    final response = await supabase.from('customers').select();

    if (response.isEmpty) {
      return null;
    } else {
      return CustomerResponseModel.fromJson(response);
    }
  }

  Future<CustomerResponseModel?> getCustomerByIdUser(int idUser) async {
    final response = await supabase.from('customers').select().eq('id_user', idUser);

    if (response.isEmpty) {
      return null;
    } else {
      return CustomerResponseModel.fromJson(response);
    }
  }

  Future<bool?> addCustomer(CustomerRequestModel? data) async {
    try {
      await supabase.from('customers').insert({
        'name': data!.name,
        'email': data.email,
        'phone': data.phone,
        'address': data.address,
        'pet_type': data.petType,
        'pet_name': data.petName,
        'pet_age': data.petAge,
        'pet_gender': data.petGender,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool?> updateCustomer(CustomerRequestModel? data) async {
    // Update Customer

    try {
      await supabase.from('customers').update({
        'name': data!.name,
        'phone': data.phone,
        'address': data.address,
        'pet_type': data.petType,
        'pet_name': data.petName,
        'pet_age': data.petAge,
        'pet_gender': data.petGender,
      }).eq('id', data.id);
      return true;
    } catch (e) {
      return false;
    }
  }
}
