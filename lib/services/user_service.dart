import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/user/user_request_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService extends GetConnect {
  final supabase = Supabase.instance.client;

  Future<bool?> addUser(UserRequestModel? data) async {
    try {
      await supabase.from('users').insert({
        'name': data!.name,
        'username': data.username,
        'password': data.password,
        'role': data.role,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool?> deleteUser(int? id) async {
    try {
      await supabase.from('users').delete().eq('id', id);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool?> updatePassword(UserRequestModel? data) async {
    try {
      await supabase.from('users').update({
        'password': data!.password,
      }).eq('id', data.id);
      return true;
    } catch (e) {
      return false;
    }
  }
}
