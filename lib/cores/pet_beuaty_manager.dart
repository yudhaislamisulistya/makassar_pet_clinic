import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/pet_beauty/pet_beauty_response_model.dart';

class PetBeautyManager extends GetxController {
  final isPetBeautyLoading = false.obs;
  final isPetBeautyError = false.obs;
  final isPetBeautyEmpty = false.obs;
  final isPetBeautySuccess = false.obs;
  late final petBeauty = [].obs;

  Future<void> savePetBeauty(PetBeautyResponseModel? data) async {
    isPetBeautyLoading.value = true;
    isPetBeautyError.value = false;
    isPetBeautyEmpty.value = false;
    isPetBeautySuccess.value = false;

    try {
      if (data == null) {
        isPetBeautyEmpty.value = true;
      } else {
        petBeauty.value = data.petBeauties;
        isPetBeautySuccess.value = true;
      }
    } catch (e) {
      isPetBeautyError.value = true;
    } finally {
      isPetBeautyLoading.value = false;
    }
  }
}
