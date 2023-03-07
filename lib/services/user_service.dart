import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/user/user_request_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService extends GetConnect {
  final supabase = Supabase.instance.client;

  Future<bool?> updatePassword(UserRequestModel? data) async {
    try {
      await supabase.from('customers').update({
        'password': data!.password,
      }).eq('id', data.id);
      return true;
    } catch (e) {
      return false;
    }
  }
}
