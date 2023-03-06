import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/rating_manager.dart';
import 'package:makassar_pet_clinic/models/rating/rating_request_model.dart';
import 'package:makassar_pet_clinic/services/rating_service.dart';

class RatingController extends GetxController {
  late final RatingService ratingService;
  late final RatingManager ratingManager;

  @override
  void onInit() {
    ratingService = Get.put(RatingService());
    ratingManager = Get.put(RatingManager());
    super.onInit();
  }

  // Get Rating By Id User And Id Expert
  Future<void> getRatingByIdUserAndIdExpert(int idUser, int idExpoert) async {
    final response = await ratingService.getRatingByIdUserAndIdExpert(RatingRequestModel(idUser: idUser, idExpert: idExpoert));
    if (response == null) {
      ratingManager.saveRating(null);
    } else {
      ratingManager.saveRating(response);
    }
  }

  Future<void> addRating(int idUser, int idExpert, int rating) async {
    final response = await ratingService.addRating(RatingRequestModel(idUser: idUser, idExpert: idExpert, rating: rating));
    if (response) {
      Get.back();
      Get.back();
      Get.showSnackbar(snackBarSuccess('Berhasil memberikan rating'));
      getRatingByIdUserAndIdExpert(idUser, idExpert);
    } else {
      Get.showSnackbar(snackBarError("Gagal Melakukan Chat"));
    }
  }
}
