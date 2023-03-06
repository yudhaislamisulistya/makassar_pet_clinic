import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/information_manager.dart';
import 'package:makassar_pet_clinic/models/information/information_request_model.dart';
import 'package:makassar_pet_clinic/services/information_service.dart';

class InformationController extends GetxController {
  late final InformationService informationService;
  late final InformationManager informationManager;

  @override
  void onInit() {
    informationService = Get.put(InformationService());
    informationManager = Get.put(InformationManager());
    super.onInit();
  }

  Future<void> getInformation() async {
    final response = await informationService.getInformation();
    if (response == null) {
      Get.showSnackbar(snackBarError("Gagal Mendapatkan Data Informasi"));
      informationManager.saveInformation(null);
    } else {
      informationManager.saveInformation(response);
    }
  }

  // Get Information With Filter
  Future<void> getInformationWithFilter(String category) async {
    final response = await informationService.getInformation();
    if (response == null) {
      Get.showSnackbar(snackBarError("Gagal Mendapatkan Data Informasi"));
      informationManager.saveInformationWithFilter(null, null);
    } else {
      informationManager.saveInformationWithFilter(response, category);
    }
  }

  Future<void> addInformation(String name, String description, String category) async {
    final response = await informationService.addInformation(InformationRequestModel(name: name, description: description, category: category));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Menambahkan Data Informasi"));
      getInformation();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Menambahkan Data Informasi"));
    }
  }

  Future<void> deleteInformation(int id) async {
    final response = await informationService.deleteInformation(InformationRequestModel(id: id));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Menghapus Data Informasi"));
      getInformation();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Menghapus Data Informasi"));
    }
  }

  Future<void> updateInformation(int id, String name, String description, String category) async {
    final response = await informationService.updateInformation(InformationRequestModel(id: id, name: name, description: description, category: category));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Mengubah Data Informasi"));
      getInformation();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Mengubah Data Informasi"));
    }
  }
}
