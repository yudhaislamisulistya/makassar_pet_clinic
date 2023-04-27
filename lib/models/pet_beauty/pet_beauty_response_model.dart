class PetBeautyModel {
  final int id;
  final String name;
  final String location;
  final String phone;
  final String servicesOffered;
  final String owner;
  final String serviceCost;
  final String createdAt;

  PetBeautyModel({
    required this.id,
    required this.name,
    required this.location,
    required this.phone,
    required this.servicesOffered,
    required this.owner,
    required this.serviceCost,
    required this.createdAt,
  });

  factory PetBeautyModel.fromJson(Map<String, dynamic> json) {
    return PetBeautyModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      phone: json['phone'],
      servicesOffered: json['services_offered'],
      owner: json['owner'],
      serviceCost: json['service_cost'],
      createdAt: json['created_at'],
    );
  }
}

class PetBeautyResponseModel {
  final List<PetBeautyModel> petBeauties;

  PetBeautyResponseModel({required this.petBeauties});

  factory PetBeautyResponseModel.fromJson(List<dynamic> json) {
    List<PetBeautyModel> petBeauties = [];
    petBeauties = json.map((petBeauty) => PetBeautyModel.fromJson(petBeauty)).toList();
    return PetBeautyResponseModel(petBeauties: petBeauties);
  }
}
