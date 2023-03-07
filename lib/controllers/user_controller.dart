import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/user_manager.dart';
import 'package:makassar_pet_clinic/models/user/user_request_model.dart';
import 'package:makassar_pet_clinic/services/user_service.dart';

class UserController extends GetxController {
  late final UserService userService;
  late final UserManager categoryManager;

  @override
  void onInit() {
    userService = Get.put(UserService());
    categoryManager = Get.put(UserManager());
    super.onInit();
  }

  Future<void> updatePassword(int id, String password) async {
    final response = await userService.updatePassword(UserRequestModel(id: id, password: password));
    if (response != null) {
      Get.showSnackbar(snackBarSuccessWithAction("Berhasil Mengupdate Password, Silahkan tekan tombol OK untuk kembali ke halaman login"));
    } else {
      Get.showSnackbar(snackBarError("Gagal Mengudapte Password"));
    }
  }
}
