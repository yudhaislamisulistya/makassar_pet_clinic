import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/pet_hotel/pet_hotel_response_model.dart';

class PetHotelManager extends GetxController {
  final isPetHotelLoading = false.obs;
  final isPetHotelError = false.obs;
  final isPetHotelEmpty = false.obs;
  final isPetHotelSuccess = false.obs;
  late final petHotel = [].obs;

  Future<void> savePetHotel(PetHotelResponseModel? data) async {
    isPetHotelLoading.value = true;
    isPetHotelError.value = false;
    isPetHotelEmpty.value = false;
    isPetHotelSuccess.value = false;

    try {
      if (data == null) {
        isPetHotelEmpty.value = true;
      } else {
        petHotel.value = data.petHotels;
        isPetHotelSuccess.value = true;
      }
    } catch (e) {
      isPetHotelError.value = true;
    } finally {
      isPetHotelLoading.value = false;
    }
  }
}
