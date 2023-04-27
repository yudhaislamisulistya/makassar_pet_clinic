import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/chat_manager.dart';
import 'package:makassar_pet_clinic/models/chat/chat_request_model.dart';
import 'package:makassar_pet_clinic/services/chat_service.dart';

class ChatController extends GetxController {
  late final ChatService chatService;
  late final ChatManager chatManager;

  @override
  void onInit() {
    chatService = Get.put(ChatService());
    chatManager = Get.put(ChatManager());
    super.onInit();
  }

  Future<void> getChatByIdUserAndIdExpert(int idUser, int idExpert) async {
    final response = await chatService.getChatByIdUserAndIdExpert(ChatRequestModel(idUser: idUser, idExpert: idExpert));
    if (response == null) {
      Get.showSnackbar(snackBarError("Gagal Mendapatkan Data Informasi Chat"));
      chatManager.saveChat(null);
    } else {
      chatManager.saveChat(response);
    }
  }

  Future<void> addChat(int idUser, int idExpert, String message, String roleName) async {
    final response = await chatService.addChat(ChatRequestModel(idUser: idUser, idExpert: idExpert, message: message, isSender: roleName));
    if (response) {
      getChatByIdUserAndIdExpert(idUser, idExpert);
    } else {
      Get.showSnackbar(snackBarError("Gagal Melakukan Chat"));
    }
  }
}
