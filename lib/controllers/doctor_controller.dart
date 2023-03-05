import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/doctor_manager.dart';
import 'package:makassar_pet_clinic/models/doctor/doctor_request_model.dart';
import 'package:makassar_pet_clinic/services/doctor_service.dart';

class DoctorController extends GetxController {
  late final DoctorService doctorService;
  late final DoctorManager doctorManager;

  @override
  void onInit() {
    doctorService = Get.put(DoctorService());
    doctorManager = Get.put(DoctorManager());
    super.onInit();
  }

  Future<void> getDoctor() async {
    final response = await doctorService.getDoctor();
    if (response == null) {
      Get.showSnackbar(snackBarError("Gagal Mendapatkan Dokter"));
    } else {
      doctorManager.saveDoctor(response);
    }
  }

  Future<void> addDoctor(
    String name,
    String email,
    String specialization,
    int experienceYears,
    String about,
    String phone,
    String avatar,
    String address,
  ) async {
    final response = await doctorService.addDoctor(DoctorRequestModel(
      name: name,
      email: email,
      specialization: specialization,
      experienceYears: experienceYears.toString(),
      about: about,
      phone: phone,
      avatar: avatar,
      address: address,
    ));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Menambahkan Dokter"));
      getDoctor();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Menambahkan Dokter"));
    }
  }

  Future<void> deleteDoctor(int id) async {
    final response = await doctorService.deleteDoctor(DoctorRequestModel(id: id));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Menghapus Dokter"));
      getDoctor();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Menghapus Dokter"));
    }
  }

  Future<void> updateDoctor(
    int id,
    String name,
    String email,
    String specialization,
    String experienceYears,
    String about,
    String phone,
    String avatar,
    String address,
  ) async {
    final response = await doctorService.updateDoctor(DoctorRequestModel(
      id: id,
      name: name,
      email: email,
      specialization: specialization,
      experienceYears: experienceYears.toString(),
      about: about,
      phone: phone,
      avatar: avatar,
      address: address,
    ));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Mengubah Dokter"));
      getDoctor();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Mengubah Dokter"));
    }
  }
}
