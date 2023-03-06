import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
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
      Get.showSnackbar(snackBarError("Gagal Mendapatkan Kategori"));
      categoryManager.saveCategory(null);
    } else {
      categoryManager.saveCategory(response);
    }
  }

  Future<void> addCategory(String name, String description, String avatar) async {
    final response = await categoryService.addCategory(CategoryRequestModel(name: name, description: description, avatar: avatar));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Menambahkan Kategori"));
      getCategory();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Menambahkan Kategori"));
    }
  }

  Future<void> deleteCategory(int id) async {
    final response = await categoryService.deleteCategory(CategoryRequestModel(id: id));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Menghapus Kategori"));
      getCategory();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Menghapus Kategori"));
    }
  }

  Future<void> updateCategory(int id, String name, String description, String avatar) async {
    final response = await categoryService.updateCategory(CategoryRequestModel(id: id, name: name, description: description, avatar: avatar));
    if (response) {
      Get.back();
      Get.showSnackbar(snackBarSuccess("Berhasil Mengubah Kategori"));
      getCategory();
    } else {
      Get.back();
      Get.showSnackbar(snackBarError("Gagal Mengubah Kategori"));
    }
  }
}
