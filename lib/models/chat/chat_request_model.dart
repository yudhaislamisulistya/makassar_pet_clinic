class ChatRequestModel {
  int? id;
  int? idUser;
  int? idExpert;
  String? message;
  String? isSender;
  String? createdAt;

  ChatRequestModel({
    this.id,
    this.idUser,
    this.idExpert,
    this.message,
    this.isSender,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'id_user': idUser,
      'id_expert': idExpert,
      'message': message,
      'is_sender': isSender,
      'created_at': createdAt,
    };
    return map;
  }
}
