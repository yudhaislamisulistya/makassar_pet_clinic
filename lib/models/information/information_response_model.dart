class InformationModel {
  final int id;
  final String name;
  final String description;
  final String category;
  final String createdAt;

  InformationModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.createdAt,
  });

  factory InformationModel.fromJson(Map<String, dynamic> json) {
    return InformationModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      createdAt: json['created_at'] as String,
    );
  }
}

class InformationResponseModel {
  final List<InformationModel> informations;

  InformationResponseModel({required this.informations});

  factory InformationResponseModel.fromJson(List<dynamic> json) {
    List<InformationModel> informations = [];
    informations = json.map((information) => InformationModel.fromJson(information)).toList();
    return InformationResponseModel(informations: informations);
  }
}
