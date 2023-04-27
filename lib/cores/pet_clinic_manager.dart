import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/pet_clinic/pet_clinic_response_model.dart';

class PetClinicManager extends GetxController {
  final isPetClinicLoading = false.obs;
  final isPetClinicError = false.obs;
  final isPetClinicEmpty = false.obs;
  final isPetClinicSuccess = false.obs;
  late final petClinic = [].obs;

  Future<void> savePetClinic(PetClinicResponseModel? data) async {
    isPetClinicLoading.value = true;
    isPetClinicError.value = false;
    isPetClinicEmpty.value = false;
    isPetClinicSuccess.value = false;

    try {
      if (data == null) {
        isPetClinicEmpty.value = true;
      } else {
        petClinic.value = data.petClinics;
        isPetClinicSuccess.value = true;
      }
    } catch (e) {
      isPetClinicError.value = true;
    } finally {
      isPetClinicLoading.value = false;
    }
  }
}
