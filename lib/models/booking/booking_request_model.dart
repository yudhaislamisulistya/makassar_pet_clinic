class BookingRequestModel {
  int? id;
  int? idUser;
  int? idExpert;
  String? status;
  String? description;
  String? dateBook;

  BookingRequestModel({
    this.id,
    this.idUser,
    this.idExpert,
    this.status,
    this.description,
    this.dateBook,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'id_user': idUser,
      'id_expert': idExpert,
      'status': status,
      'description': description,
      'date_book': dateBook,
    };
    return map;
  }
}
