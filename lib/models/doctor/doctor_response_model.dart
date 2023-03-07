class DoctorModel {
  final int id;
  final int idExpert;
  final String name;
  final String email;
  final String specialization;
  final String experienceYears;
  final String about;
  final String phone;
  final String avatar;
  final String address;
  final String createdAt;

  DoctorModel({
    required this.id,
    required this.idExpert,
    required this.name,
    required this.email,
    required this.specialization,
    required this.experienceYears,
    required this.about,
    required this.phone,
    required this.avatar,
    required this.address,
    required this.createdAt,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      idExpert: json['id_expert'],
      name: json['name'],
      email: json['email'],
      specialization: json['specialization'],
      experienceYears: json['experience_years'],
      about: json['about'],
      phone: json['phone'],
      avatar: json['avatar'],
      address: json['address'],
      createdAt: json['created_at'],
    );
  }
}

class DoctorResponseModel {
  final List<DoctorModel> doctors;

  DoctorResponseModel({required this.doctors});

  factory DoctorResponseModel.fromJson(List<dynamic> json) {
    List<DoctorModel> doctors = [];
    doctors = json.map((category) => DoctorModel.fromJson(category)).toList();
    return DoctorResponseModel(doctors: doctors);
  }
}
