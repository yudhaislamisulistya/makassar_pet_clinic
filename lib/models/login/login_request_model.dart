class LoginRequestModel {
  int? id;
  String? name;
  String? username;
  String? password;
  String? role;

  LoginRequestModel({
    this.id,
    this.name,
    this.username,
    this.password,
    this.role,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'username': username,
      'password': password,
      'role': role,
    };
    return map;
  }
}
