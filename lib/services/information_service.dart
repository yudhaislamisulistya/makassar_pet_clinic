import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/information/information_request_model.dart';
import 'package:makassar_pet_clinic/models/information/information_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InformationService extends GetConnect {
  final supabase = Supabase.instance.client;

  Future<InformationResponseModel?> getInformation() async {
    final response = await supabase.from('information').select();

    if (response.isEmpty) {
      return null;
    } else {
      return InformationResponseModel.fromJson(response);
    }
  }

  Future<bool> addInformation(InformationRequestModel model) async {
    try {
      await supabase.from('information').insert({
        'name': model.name,
        'description': model.description,
        'category': model.category,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteInformation(InformationRequestModel model) async {
    try {
      await supabase.from('information').delete().match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateInformation(InformationRequestModel model) async {
    try {
      await supabase.from('information').update({
        'name': model.name,
        'description': model.description,
        'category': model.category,
      }).match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }
}
