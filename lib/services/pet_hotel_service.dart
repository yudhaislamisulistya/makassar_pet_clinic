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
        'hotelName': model.hotelName,
        'location': model.location,
        'phone': model.phone,
        'address': model.address,
        'email': model.email,
        'website': model.website,
        'operatingHours': model.operatingHours,
        'servicesOffered': model.servicesOffered,
        'checkInTime': model.checkInTime,
        'checkOutTime': model.checkOutTime,
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
        'hotelName': model.hotelName,
        'location': model.location,
        'phone': model.phone,
        'address': model.address,
        'email': model.email,
        'website': model.website,
        'operatingHours': model.operatingHours,
        'servicesOffered': model.servicesOffered,
        'checkInTime': model.checkInTime,
        'checkOutTime': model.checkOutTime,
      }).match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }
}
