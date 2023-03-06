// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/chat/chat_response_model.dart';

class ChatManager extends GetxController {
  final isChatLoading = false.obs;
  final isChatError = false.obs;
  final isChatEmpty = false.obs;
  final isChatSuccess = false.obs;
  final chat = [].obs;

  Future<void> saveChat(ChatResponseModel? data) async {
    isChatLoading.value = true;
    isChatError.value = false;
    isChatEmpty.value = false;
    isChatSuccess.value = false;

    try {
      if (data == null) {
        isChatEmpty.value = true;
      } else {
        chat.value = data.chats;
        isChatSuccess.value = true;
      }
    } catch (e) {
      isChatError.value = true;
    } finally {
      isChatLoading.value = false;
    }
  }
}
