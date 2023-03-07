import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/user/user_response_model.dart';

class UserManager extends GetxController {
  final isUserLoading = false.obs;
  final isUserError = false.obs;
  final isUserEmpty = false.obs;
  final isUserSuccess = false.obs;
  final user = [].obs;

  Future<void> saveUser(UserResponseModel? data) async {
    isUserLoading.value = true;
    isUserError.value = false;
    isUserEmpty.value = false;
    isUserSuccess.value = false;

    try {
      if (data == null) {
        isUserEmpty.value = true;
      } else {
        user.value = data.users;
        isUserSuccess.value = true;
      }
    } catch (e) {
      isUserError.value = true;
    } finally {
      isUserLoading.value = false;
    }
  }
}
