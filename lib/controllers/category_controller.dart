import 'package:get/get.dart';
import 'package:makassar_pet_clinic/cores/category_manager.dart';
import 'package:makassar_pet_clinic/models/category/category_request_model.dart';
import 'package:makassar_pet_clinic/services/category_service.dart';

class CategoryController extends GetxController {
  late final CategoryService categoryService;
  late final CategoryManager categoryManager;

  @override
  void onInit() {
    categoryService = Get.put(CategoryService());
    categoryManager = Get.put(CategoryManager());
    super.onInit();
  }

  Future<void> getCategory() async {
    final response = await categoryService.getCategory();
    if (response == null) {
      Get.snackbar('Error', 'Failed to get category');
    } else {
      categoryManager.saveCategory(response);
    }
  }

  Future<void> addCategory(String name) async {
    final response = await categoryService.addCategory(CategoryRequestModel(name: name));
    if (response) {
      Get.back();
      Get.snackbar('Success', 'Category added');
      getCategory();
    } else {
      Get.back();
      Get.snackbar('Error', 'Failed to add category');
    }
  }

  Future<void> deleteCategory(int id) async {
    final response = await categoryService.deleteCategory(CategoryRequestModel(id: id));
    if (response) {
      Get.back();
      Get.snackbar('Success', 'Category deleted');
      getCategory();
    } else {
      Get.back();
      Get.snackbar('Error', 'Failed to delete category');
    }
  }

  Future<void> updateCategory(int id, String name) async {
    final response = await categoryService.updateCategory(CategoryRequestModel(id: id, name: name));
    if (response) {
      Get.back();
      Get.snackbar('Success', 'Category updated');
      getCategory();
    } else {
      Get.back();
      Get.snackbar('Error', 'Failed to update category');
    }
  }
}
