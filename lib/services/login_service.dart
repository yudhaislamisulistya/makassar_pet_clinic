import 'package:get/get_connect.dart';
import 'package:makassar_pet_clinic/models/login/login_request_model.dart';
import 'package:makassar_pet_clinic/models/login/login_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginService extends GetConnect {
  final supabase = Supabase.instance.client;

  Future<LoginResponseModel?> getUser(LoginRequestModel model) async {
    final response = await supabase.from('users').select().eq('username', model.username).eq('password', model.password);
    if (response.isEmpty) {
      return null;
    } else {
      return LoginResponseModel.fromJson(response);
    }
  }
}
