// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/information/information_response_model.dart';

class InformationManager extends GetxController {
  final isInformationLoading = false.obs;
  final isInformationError = false.obs;
  final isInformationEmpty = false.obs;
  final isInformationSuccess = false.obs;
  final information = [].obs;

  Future<void> saveInformation(InformationResponseModel? data) async {
    isInformationLoading.value = true;
    isInformationError.value = false;
    isInformationEmpty.value = false;
    isInformationSuccess.value = false;

    try {
      if (data == null) {
        isInformationEmpty.value = true;
      } else {
        information.value = data.informations;
        isInformationSuccess.value = true;
      }
    } catch (e) {
      isInformationError.value = true;
    } finally {
      isInformationLoading.value = false;
    }
  }

  Future<void> saveInformationWithFilter(InformationResponseModel? data, String? category) async {
    isInformationLoading.value = true;
    isInformationError.value = false;
    isInformationEmpty.value = false;
    isInformationSuccess.value = false;

    try {
      if (data == null) {
        isInformationEmpty.value = true;
      } else {
        information.value = data.informations.where((element) => element.category == category).toList();
        if (information.value.isEmpty) {
          isInformationEmpty.value = true;
        }
        isInformationSuccess.value = true;
      }
    } catch (e) {
      isInformationError.value = true;
    } finally {
      isInformationLoading.value = false;
    }
  }
}
