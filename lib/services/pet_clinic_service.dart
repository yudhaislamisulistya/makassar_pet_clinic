import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/pet_clinic/pet_clinic_request_model.dart';
import 'package:makassar_pet_clinic/models/pet_clinic/pet_clinic_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PetClinicService extends GetConnect {
  final supabase = Supabase.instance.client;

  Future<PetClinicResponseModel?> getPetClinic() async {
    final response = await supabase.from('pet_clinic').select();
    if (response.isEmpty) {
      return null;
    } else {
      return PetClinicResponseModel.fromJson(response);
    }
  }

  Future<bool> addPetClinic(PetClinicRequestModel model) async {
    try {
      await supabase.from('pet_clinic').insert({
        'clinic_name': model.clinicName,
        'location': model.location,
        'phone': model.phone,
        'address': model.address,
        'email': model.email,
        'website': model.website,
        'operating_hours': model.operatingHours,
        'services_offered': model.servicesOffered,
        'facilities': model.facilities,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deletePetClinic(PetClinicRequestModel model) async {
    try {
      await supabase.from('pet_clinic').delete().match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updatePetClinic(PetClinicRequestModel model) async {
    try {
      await supabase.from('pet_clinic').update({
        'clinic_name': model.clinicName,
        'location': model.location,
        'phone': model.phone,
        'address': model.address,
        'email': model.email,
        'website': model.website,
        'operating_hours': model.operatingHours,
        'services_offered': model.servicesOffered,
        'facilities': model.facilities,
      }).match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }
}
