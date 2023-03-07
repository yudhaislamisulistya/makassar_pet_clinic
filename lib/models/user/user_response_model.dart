class UserModel {
  final int id;
  final String name;
  final String description;
  final String avatar;
  final String createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.description,
    required this.avatar,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      avatar: json['avatar'] as String,
      createdAt: json['created_at'] as String,
    );
  }
}

class UserResponseModel {
  final List<UserModel> users;

  UserResponseModel({required this.users});

  factory UserResponseModel.fromJson(List<dynamic> json) {
    List<UserModel> users = [];
    users = json.map((user) => UserModel.fromJson(user)).toList();
    return UserResponseModel(users: users);
  }
}
