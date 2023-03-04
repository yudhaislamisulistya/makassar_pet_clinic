class CategoryModel {
  final int id;
  final String name;
  final String createdAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      createdAt: json['created_at'] as String,
    );
  }
}

class CategoryResponseModel {
  final List<CategoryModel> categories;

  CategoryResponseModel({required this.categories});

  factory CategoryResponseModel.fromJson(List<dynamic> json) {
    List<CategoryModel> categories = [];
    categories = json.map((category) => CategoryModel.fromJson(category)).toList();
    return CategoryResponseModel(categories: categories);
  }
}
