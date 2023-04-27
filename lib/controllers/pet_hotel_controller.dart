import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/pet_hotel_manager.dart';
import 'package:makassar_pet_clinic/models/pet_hotel/pet_hotel_request_model.dart';
import 'package:makassar_pet_clinic/services/pet_hotel_service.dart';

class PetHotelController extends GetxController {
  late final PetHotelService petHotelService;
  late final PetHotelManager petHotelManager;

  @override
  void onInit() {
    petHotelService = Get.put(PetHotelService());
    petHotelManager = Get.put(PetHotelManager());
    super.onInit();
  }

  Future<void> getPetHotel() async {
    final response = await petHotelService.getPetHotel();
    if (response == null) {
      Get.showSnackbar(snackBarError("Gagal Mendapatkan Pet Hotel"));
      petHotelManager.savePetHotel(null);
    } else {
      petHotelManager.savePetHotel(response);
    }
  }

  Future<void> addPetHotel(
    String hotelName,
    String location,
    String phone,
    String address,
    String email,
    String website,
    String operatingHours,
    String servicesOffered,
    String checkInTime,
    String checkOutTime,
  ) async {
    final response = await petHotelService.addPetHotel(PetHotelRequestModel(
      hotelName: hotelName,
      location: location,
      phone: phone,
      address: address,
      email: email,
      website: website,
      operatingHours: operatingHours,
      servicesOffered: servicesOffered,
      checkInTime: checkInTime,
      checkOutTime: checkOutTime,
    ));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Menambahkan Pet Hotel"));
      getPetHotel();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Menambahkan Pet Hotel"));
    }
  }

  Future<void> deletePetHotel(int id) async {
    final response = await petHotelService.deletePetHotel(PetHotelRequestModel(id: id));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Menghapus Pet Hotel"));
      getPetHotel();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Menghapus Pet Hotel"));
    }
  }

  Future<void> updatePetHotel(
    int id,
    String hotelName,
    String location,
    String phone,
    String address,
    String email,
    String website,
    String operatingHours,
    String servicesOffered,
    String checkInTime,
    String checkOutTime,
  ) async {
    final response = await petHotelService.updatePetHotel(PetHotelRequestModel(
      id: id,
      hotelName: hotelName,
      location: location,
      phone: phone,
      address: address,
      email: email,
      website: website,
      operatingHours: operatingHours,
      servicesOffered: servicesOffered,
      checkInTime: checkInTime,
      checkOutTime: checkOutTime,
    ));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Mengubah Pet Hotel"));
      getPetHotel();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Mengubah Pet Hotel"));
    }
  }
}
