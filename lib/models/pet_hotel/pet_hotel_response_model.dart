class PetHotelModel {
  final int id;
  final String hotelName;
  final String location;
  final String phone;
  final String address;
  final String email;
  final String website;
  final String operatingHours;
  final String servicesOffered;
  final String checkInTime;
  final String checkOutTime;

  PetHotelModel({
    required this.id,
    required this.hotelName,
    required this.location,
    required this.phone,
    required this.address,
    required this.email,
    required this.website,
    required this.operatingHours,
    required this.servicesOffered,
    required this.checkInTime,
    required this.checkOutTime,
  });

  factory PetHotelModel.fromJson(Map<String, dynamic> json) {
    return PetHotelModel(
      id: json['id'],
      hotelName: json['hotel_name'],
      location: json['location'],
      phone: json['phone'],
      address: json['address'],
      email: json['email'],
      website: json['website'],
      operatingHours: json['operating_hours'],
      servicesOffered: json['services_offered'],
      checkInTime: json['check_in_time'],
      checkOutTime: json['check_out_time'],
    );
  }
}

class PetHotelResponseModel {
  final List<PetHotelModel> petHotels;

  PetHotelResponseModel({required this.petHotels});

  factory PetHotelResponseModel.fromJson(List<dynamic> json) {
    List<PetHotelModel> petHotels = [];
    petHotels = json.map((petHotel) => PetHotelModel.fromJson(petHotel)).toList();
    return PetHotelResponseModel(petHotels: petHotels);
  }
}
