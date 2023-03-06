class ChatModel {
  final int id;
  final int idUser;
  final int idExpert;
  final String message;
  final String isSender;
  final String createdAt;

  ChatModel({
    required this.id,
    required this.idUser,
    required this.idExpert,
    required this.message,
    required this.isSender,
    required this.createdAt,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] as int,
      idUser: json['id_user'] as int,
      idExpert: json['id_expert'] as int,
      message: json['message'] as String,
      isSender: json['is_sender'] as String,
      createdAt: json['created_at'] as String,
    );
  }
}

class ChatResponseModel {
  final List<ChatModel> chats;

  ChatResponseModel({required this.chats});

  factory ChatResponseModel.fromJson(List<dynamic> json) {
    List<ChatModel> chats = [];
    chats = json.map((chat) => ChatModel.fromJson(chat)).toList();
    return ChatResponseModel(chats: chats);
  }
}
