class RatingModel {
  final int id;
  final int idUser;
  final int idExpert;
  final int rating;
  final String createdAt;

  RatingModel({
    required this.id,
    required this.idUser,
    required this.idExpert,
    required this.rating,
    required this.createdAt,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      id: json['id'] as int,
      idUser: json['id_user'] as int,
      idExpert: json['id_expert'] as int,
      rating: json['rating'] as int,
      createdAt: json['created_at'] as String,
    );
  }
}

class RatingResponseModel {
  final List<RatingModel> ratings;

  RatingResponseModel({required this.ratings});

  factory RatingResponseModel.fromJson(List<dynamic> json) {
    List<RatingModel> ratings = [];
    ratings = json.map((rating) => RatingModel.fromJson(rating)).toList();
    return RatingResponseModel(ratings: ratings);
  }
}
