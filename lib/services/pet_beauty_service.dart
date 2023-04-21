import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/pet_beauty/pet_beauty_request_model.dart';
import 'package:makassar_pet_clinic/models/pet_beauty/pet_beauty_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PetBeautyService extends GetConnect {
  final supabase = Supabase.instance.client;

  Future<PetBeautyResponseModel?> getPetBeauty() async {
    final response = await supabase.from('pet_beauty').select();

    if (response.isEmpty) {
      return null;
    } else {
      return PetBeautyResponseModel.fromJson(response);
    }
  }

  Future<bool> addPetBeauty(PetBeautyRequestModel model) async {
    try {
      await supabase.from('pet_beauty').insert({
        'name': model.name,
        'location': model.location,
        'phone': model.phone,
        'service_offered': model.serviceOffered,
        'owner': model.owner,
        'service_cost': model.serviceCost,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deletePetBeauty(PetBeautyRequestModel model) async {
    try {
      await supabase.from('pet_beauty').delete().match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updatePetBeauty(PetBeautyRequestModel model) async {
    try {
      await supabase.from('pet_beauty').update({
        'name': model.name,
        'location': model.location,
        'phone': model.phone,
        'service_offered': model.serviceOffered,
        'owner': model.owner,
        'service_cost': model.serviceCost,
      }).match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }
}
