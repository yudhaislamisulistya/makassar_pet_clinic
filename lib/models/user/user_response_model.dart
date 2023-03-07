class UserModel {
  final int id;
  final String name;
  final String username;
  final String password;
  final String role;
  final String createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.role,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
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
