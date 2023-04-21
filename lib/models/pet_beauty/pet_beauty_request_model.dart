class PetBeautyRequestModel {
  int? id;
  String? name;
  String? location;
  String? phone;
  String? serviceOffered;
  String? owner;
  String? serviceCost;
  String? createdAt;

  PetBeautyRequestModel({
    this.id,
    this.name,
    this.location,
    this.phone,
    this.serviceOffered,
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
      'service_offered': serviceOffered,
      'owner': owner,
      'service_cost': serviceCost,
      'created_at': createdAt,
    };
    return map;
  }
}
