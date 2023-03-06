// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/rating/rating_response_model.dart';

class RatingManager extends GetxController {
  final isRatingLoading = false.obs;
  final isRatingError = false.obs;
  final isRatingEmpty = false.obs;
  final isRatingSuccess = false.obs;
  final rating = [].obs;

  Future<void> saveRating(RatingResponseModel? data) async {
    isRatingLoading.value = true;
    isRatingError.value = false;
    isRatingEmpty.value = false;
    isRatingSuccess.value = false;

    try {
      if (data == null) {
        isRatingEmpty.value = true;
      } else {
        rating.value = data.ratings;
        isRatingSuccess.value = true;
      }
    } catch (e) {
      isRatingError.value = true;
    } finally {
      isRatingLoading.value = false;
    }
  }
}
