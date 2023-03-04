class CategoryRequestModel {
  int? id;
  String? name;

  CategoryRequestModel({
    this.id,
    this.name,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
    };
    return map;
  }
}
