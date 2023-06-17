import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/pet_hotel/pet_hotel_request_model.dart';
import 'package:makassar_pet_clinic/models/pet_hotel/pet_hotel_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PetHotelService extends GetConnect {
  final supabase = Supabase.instance.client;

  Future<PetHotelResponseModel?> getPetHotel() async {
    final response = await supabase.from('pet_hotel').select();
    if (response.isEmpty) {
      return null;
    } else {
      return PetHotelResponseModel.fromJson(response);
    }
  }

  Future<bool> addPetHotel(PetHotelRequestModel model) async {
    try {
      await supabase.from('pet_hotel').insert({
        'hotel_name': model.hotelName,
        'location': model.location,
        'phone': model.phone,
        'address': model.address,
        'email': model.email,
        'website': model.website,
        'operating_hours': model.operatingHours,
        'services_offered': model.servicesOffered,
        'check_in_time': model.checkInTime,
        'check_out_time': model.checkOutTime,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deletePetHotel(PetHotelRequestModel model) async {
    try {
      await supabase.from('pet_hotel').delete().match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updatePetHotel(PetHotelRequestModel model) async {
    try {
      await supabase.from('pet_hotel').update({
        'hotel_name': model.hotelName,
        'location': model.location,
        'phone': model.phone,
        'address': model.address,
        'email': model.email,
        'website': model.website,
        'operating_hours': model.operatingHours,
        'services_offered': model.servicesOffered,
        'check_in_time': model.checkInTime,
        'check_out_time': model.checkOutTime,
      }).match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }
}
