import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/category/category_response_model.dart';

class CategoryManager extends GetxController {
  final isCategoryLoading = false.obs;
  final isCategoryError = false.obs;
  final isCategoryEmpty = false.obs;
  final isCategorySuccess = false.obs;
  final category = [].obs;

  Future<void> saveCategory(CategoryResponseModel? data) async {
    isCategoryLoading.value = true;
    isCategoryError.value = false;
    isCategoryEmpty.value = false;
    isCategorySuccess.value = false;

    try {
      if (data == null) {
        isCategoryEmpty.value = true;
      } else {
        category.value = data.categories;
        isCategorySuccess.value = true;
      }
    } catch (e) {
      isCategoryError.value = true;
    } finally {
      isCategoryLoading.value = false;
    }
  }
}
