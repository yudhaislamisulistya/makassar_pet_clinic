import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/category/category_request_model.dart';
import 'package:makassar_pet_clinic/models/category/category_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CategoryService extends GetConnect {
  final supabase = Supabase.instance.client;

  Future<CategoryResponseModel?> getCategory() async {
    final response = await supabase.from('category').select();

    if (response.isEmpty) {
      return null;
    } else {
      return CategoryResponseModel.fromJson(response);
    }
  }

  Future<bool> addCategory(CategoryRequestModel model) async {
    try {
      if (model.avatar == "Avatar 1") {
        model.avatar = 'assets/images/pyschologist.png';
      } else if (model.avatar == "Avatar 2") {
        model.avatar = 'assets/images/dentists.png';
      } else if (model.avatar == "Avatar 3") {
        model.avatar = 'assets/images/emergency.png';
      }
      await supabase.from('category').insert({
        'name': model.name,
        'description': model.description,
        'avatar': model.avatar,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteCategory(CategoryRequestModel model) async {
    try {
      await supabase.from('category').delete().match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateCategory(CategoryRequestModel model) async {
    try {
      if (model.avatar == "Avatar 1") {
        model.avatar = 'assets/images/pyschologist.png';
      } else if (model.avatar == "Avatar 2") {
        model.avatar = 'assets/images/dentists.png';
      } else if (model.avatar == "Avatar 3") {
        model.avatar = 'assets/images/emergency.png';
      }
      await supabase.from('category').update({
        'name': model.name,
        'description': model.description,
        'avatar': model.avatar,
      }).match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }
}
