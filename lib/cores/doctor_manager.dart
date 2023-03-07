import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/doctor/doctor_response_model.dart';

class DoctorManager extends GetxController {
  final isDoctorLoading = false.obs;
  final isDoctorError = false.obs;
  final isDoctorEmpty = false.obs;
  final isDoctorSuccess = false.obs;
  late final doctor = [].obs;
  late final doctorWithFilter = [].obs;

  Future<void> saveDoctor(DoctorResponseModel? data) async {
    isDoctorLoading.value = true;
    isDoctorError.value = false;
    isDoctorEmpty.value = false;
    isDoctorSuccess.value = false;

    try {
      if (data == null) {
        isDoctorEmpty.value = true;
      } else {
        doctor.value = data.doctors;
        isDoctorSuccess.value = true;
      }
    } catch (e) {
      isDoctorError.value = true;
    } finally {
      isDoctorLoading.value = false;
    }
  }

  Future<void> saveDoctorWithFilter(DoctorResponseModel? data) async {
    isDoctorLoading.value = true;
    isDoctorError.value = false;
    isDoctorEmpty.value = false;
    isDoctorSuccess.value = false;

    try {
      if (data == null) {
        isDoctorEmpty.value = true;
      } else {
        doctorWithFilter.value = data.doctors;
        isDoctorSuccess.value = true;
      }
    } catch (e) {
      isDoctorError.value = true;
    } finally {
      isDoctorLoading.value = false;
    }
  }
}
