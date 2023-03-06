class CategoryRequestModel {
  int? id;
  String? name;
  String? description;
  String? avatar;

  CategoryRequestModel({
    this.id,
    this.name,
    this.description,
    this.avatar,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'description': description,
      'avatar': avatar,
    };
    return map;
  }
}
