class DoctorRequestModel {
  int? id;
  int? idExpert;
  String? name;
  String? email;
  String? specialization;
  String? experienceYears;
  String? about;
  String? phone;
  String? avatar;
  String? address;
  String? createdAt;

  DoctorRequestModel({
    this.id,
    this.idExpert,
    this.name,
    this.email,
    this.specialization,
    this.experienceYears,
    this.about,
    this.phone,
    this.avatar,
    this.address,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'id_expert': idExpert,
      'name': name,
      'email': email,
      'specialization': specialization,
      'experience_years': experienceYears,
      'about': about,
      'phone': phone,
      'avatar': avatar,
      'address': address,
      'created_at': createdAt,
    };
    return map;
  }
}
