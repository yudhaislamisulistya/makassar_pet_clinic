class UserRequestModel {
  int? id;
  String? name;
  String? username;
  String? password;
  String? role;

  UserRequestModel({
    this.id,
    this.name,
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'username': username,
      'password': password,
    };
    return map;
  }
}
