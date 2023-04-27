class PetBeautyRequestModel {
  int? id;
  String? name;
  String? location;
  String? phone;
  String? servicesOffered;
  String? owner;
  String? serviceCost;
  String? createdAt;

  PetBeautyRequestModel({
    this.id,
    this.name,
    this.location,
    this.phone,
    this.servicesOffered,
    this.owner,
    this.serviceCost,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'location': location,
      'phone': phone,
      'services_offered': servicesOffered,
      'owner': owner,
      'service_cost': serviceCost,
      'created_at': createdAt,
    };
    return map;
  }
}
