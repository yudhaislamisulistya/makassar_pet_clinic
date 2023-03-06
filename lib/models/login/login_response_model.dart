class LoginModel {
  final int id;
  final String name;
  final String username;
  final String password;
  final String role;

  LoginModel({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.role,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      password: json['password'],
      role: json['role'],
    );
  }
}

class LoginResponseModel {
  final List<LoginModel> users;

  LoginResponseModel({required this.users});

  factory LoginResponseModel.fromJson(List<dynamic> json) {
    List<LoginModel> users = [];
    users = json.map((category) => LoginModel.fromJson(category)).toList();
    return LoginResponseModel(users: users);
  }
}
