class InformationRequestModel {
  int? id;
  String? name;
  String? description;
  String? category;

  InformationRequestModel({
    this.id,
    this.name,
    this.description,
    this.category,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
    };
    return map;
  }
}
