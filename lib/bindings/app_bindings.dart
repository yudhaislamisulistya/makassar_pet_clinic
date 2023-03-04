import 'package:get/get.dart';
import 'package:makassar_pet_clinic/controllers/category_controller.dart';
import 'package:makassar_pet_clinic/cores/category_manager.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
    Get.put(CategoryManager());
  }
}
