import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/rating/rating_request_model.dart';
import 'package:makassar_pet_clinic/models/rating/rating_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RatingService extends GetConnect {
  final supabase = Supabase.instance.client;

  Future<bool> addRating(RatingRequestModel model) async {
    try {
      await supabase.from('ratings').insert({
        'id_user': model.idUser,
        'id_expert': model.idExpert,
        'rating': model.rating,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<RatingResponseModel?> getRatingByIdUserAndIdExpert(RatingRequestModel? model) async {
    // Get Customer by idUser
    final response = await supabase.from('ratings').select().eq('id_user', model!.idUser).eq('id_expert', model.idExpert).order('created_at', ascending: true);

    if (response.isEmpty) {
      return null;
    } else {
      return RatingResponseModel.fromJson(response);
    }
  }
}
