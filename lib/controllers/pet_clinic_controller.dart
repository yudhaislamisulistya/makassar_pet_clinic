import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/pet_clinic_manager.dart';
import 'package:makassar_pet_clinic/models/pet_clinic/pet_clinic_request_model.dart';
import 'package:makassar_pet_clinic/services/pet_clinic_service.dart';

class PetClinicController extends GetxController {
  late final PetClinicService petClinicService;
  late final PetClinicManager petClinicManager;

  @override
  void onInit() {
    petClinicService = Get.put(PetClinicService());
    petClinicManager = Get.put(PetClinicManager());
    super.onInit();
  }

  Future<void> getPetClinic() async {
    final response = await petClinicService.getPetClinic();
    if (response == null) {
      Get.showSnackbar(snackBarError("Gagal Mendapatkan Pet Klinik"));
      petClinicManager.savePetClinic(null);
    } else {
      petClinicManager.savePetClinic(response);
    }
  }

  Future<void> addPetClinic(
    String clinicName,
    String location,
    String phone,
    String address,
    String email,
    String website,
    String operatingHours,
    String servicesOffered,
    String facilities,
  ) async {
    final response = await petClinicService.addPetClinic(PetClinicRequestModel(
      clinicName: clinicName,
      location: location,
      phone: phone,
      address: address,
      email: email,
      website: website,
      operatingHours: operatingHours,
      servicesOffered: servicesOffered,
      facilities: facilities,
    ));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Menambahkan Pet Klinik"));
      getPetClinic();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Menambahkan Pet Klinik"));
    }
  }

  Future<void> deletePetClinic(int id) async {
    final response = await petClinicService.deletePetClinic(PetClinicRequestModel(id: id));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Menghapus Pet Klinik"));
      getPetClinic();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Menghapus Pet Klinik"));
    }
  }

  Future<void> updatePetClinic(
    int id,
    String clinicName,
    String location,
    String phone,
    String address,
    String email,
    String website,
    String operatingHours,
    String servicesOffered,
    String facilities,
  ) async {
    final response = await petClinicService.updatePetClinic(PetClinicRequestModel(
      id: id,
      clinicName: clinicName,
      location: location,
      phone: phone,
      address: address,
      email: email,
      website: website,
      operatingHours: operatingHours,
      servicesOffered: servicesOffered,
      facilities: facilities,
    ));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Mengubah Pet Klinik"));
      getPetClinic();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Mengubah Pet Klinik"));
    }
  }
}
