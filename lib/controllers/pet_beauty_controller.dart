import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/pet_beuaty_manager.dart';
import 'package:makassar_pet_clinic/models/pet_beauty/pet_beauty_request_model.dart';
import 'package:makassar_pet_clinic/services/pet_beauty_service.dart';

class PetBeautyController extends GetxController {
  late final PetBeautyService petBeautyService;
  late final PetBeautyManager petBeautyManager;

  @override
  void onInit() {
    petBeautyService = Get.put(PetBeautyService());
    petBeautyManager = Get.put(PetBeautyManager());
    super.onInit();
  }

  Future<void> getPetBeauty() async {
    final response = await petBeautyService.getPetBeauty();
    if (response == null) {
      Get.showSnackbar(snackBarError("Gagal Mendapatkan Pet Salon"));
      petBeautyManager.savePetBeauty(null);
    } else {
      petBeautyManager.savePetBeauty(response);
    }
  }

  Future<void> addPetBeauty(
    String name,
    String location,
    String phone,
    String serviceOffered,
    String owner,
    String serviceCost,
  ) async {
    final response = await petBeautyService.addPetBeauty(PetBeautyRequestModel(
      name: name,
      location: location,
      phone: phone,
      serviceOffered: serviceOffered,
      owner: owner,
      serviceCost: serviceCost,
    ));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Menambahkan Pet Salon"));
      getPetBeauty();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Menambahkan Pet Salon"));
    }
  }

  Future<void> deletePetBeauty(int id) async {
    final response = await petBeautyService.deletePetBeauty(PetBeautyRequestModel(id: id));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Menghapus Pet Salon"));
      getPetBeauty();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Menghapus Pet Salon"));
    }
  }

  Future<void> updatePetBeauty(
    int id,
    String name,
    String location,
    String phone,
    String serviceOffered,
    String owner,
    String serviceCost,
  ) async {
    final response = await petBeautyService.updatePetBeauty(PetBeautyRequestModel(
      id: id,
      name: name,
      location: location,
      phone: phone,
      serviceOffered: serviceOffered,
      owner: owner,
      serviceCost: serviceCost,
    ));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Mengubah Pet Salon"));
      getPetBeauty();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Mengubah Pet Salon"));
    }
  }
}
