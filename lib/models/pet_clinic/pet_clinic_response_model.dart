class PetClinicModel {
  final int id;
  final String clinicName;
  final String location;
  final String phone;
  final String address;
  final String email;
  final String website;
  final String operatingHours;
  final String servicesOffered;
  final String facilities;

  PetClinicModel({
    required this.id,
    required this.clinicName,
    required this.location,
    required this.phone,
    required this.address,
    required this.email,
    required this.website,
    required this.operatingHours,
    required this.servicesOffered,
    required this.facilities,
  });

  factory PetClinicModel.fromJson(Map<String, dynamic> json) {
    return PetClinicModel(
      id: json['id'],
      clinicName: json['clinic_name'],
      location: json['location'],
      phone: json['phone'],
      address: json['address'],
      email: json['email'],
      website: json['website'],
      operatingHours: json['operating_hours'],
      servicesOffered: json['services_offered'],
      facilities: json['facilities'],
    );
  }
}

class PetClinicResponseModel {
  final List<PetClinicModel> petClinics;

  PetClinicResponseModel({required this.petClinics});

  factory PetClinicResponseModel.fromJson(List<dynamic> json) {
    List<PetClinicModel> petClinics = [];
    petClinics = json.map((petClinic) => PetClinicModel.fromJson(petClinic)).toList();
    return PetClinicResponseModel(petClinics: petClinics);
  }
}
