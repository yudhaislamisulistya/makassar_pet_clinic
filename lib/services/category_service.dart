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
      await supabase.from('category').insert({'name': model.name});
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
      await supabase.from('category').update({'name': model.name}).match({'id': model.id});
      return true;
    } catch (e) {
      return false;
    }
  }
}
