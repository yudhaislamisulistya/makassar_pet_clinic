class CustomerRequestModel {
  int? id;
  int? idUser;
  String? name;
  String? email;
  String? address;
  String? phone;
  String? petType;
  String? petName;
  String? petAge;
  String? petGender;
  String? createdAt;

  CustomerRequestModel({
    this.id,
    this.idUser,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.petType,
    this.petName,
    this.petAge,
    this.petGender,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'id_user': idUser,
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'pet_type': petType,
      'pet_name': petName,
      'pet_age': petAge,
      'pet_gender': petGender,
      'created_at': createdAt,
    };
    return map;
  }
}
