class PetClinicRequestModel {
  int? id;
  String? clinicName;
  String? location;
  String? phone;
  String? address;
  String? email;
  String? website;
  String? operatingHours;
  String? servicesOffered;
  String? facilities;

  PetClinicRequestModel({
    this.id,
    this.clinicName,
    this.location,
    this.phone,
    this.address,
    this.email,
    this.website,
    this.operatingHours,
    this.servicesOffered,
    this.facilities,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'clinic_name': clinicName,
      'location': location,
      'phone': phone,
      'address': address,
      'email': email,
      'website': website,
      'operating_hours': operatingHours,
      'services_offered': servicesOffered,
      'facilities': facilities,
    };
    return map;
  }
}
