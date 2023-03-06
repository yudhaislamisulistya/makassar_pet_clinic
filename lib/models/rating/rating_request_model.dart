class RatingRequestModel {
  int? id;
  int? idUser;
  int? idExpert;
  int? rating;
  String? createdAt;

  RatingRequestModel({
    this.id,
    this.idUser,
    this.idExpert,
    this.rating,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'id_user': idUser,
      'id_expert': idExpert,
      'rating': rating,
      'created_at': createdAt,
    };
    return map;
  }
}
