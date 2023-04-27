class PetHotelRequestModel {
  int? id;
  String? hotelName;
  String? location;
  String? phone;
  String? address;
  String? email;
  String? website;
  String? operatingHours;
  String? servicesOffered;
  String? checkInTime;
  String? checkOutTime;

  PetHotelRequestModel({
    this.id,
    this.hotelName,
    this.location,
    this.phone,
    this.address,
    this.email,
    this.website,
    this.operatingHours,
    this.servicesOffered,
    this.checkInTime,
    this.checkOutTime,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'hotel_name': hotelName,
      'location': location,
      'phone': phone,
      'address': address,
      'email': email,
      'website': website,
      'operating_hours': operatingHours,
      'services_offered': servicesOffered,
      'check_in_time': checkInTime,
      'check_out_time': checkOutTime,
    };
    return map;
  }
}
