import 'package:get/get.dart';
import 'package:makassar_pet_clinic/models/chat/chat_request_model.dart';
import 'package:makassar_pet_clinic/models/chat/chat_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatService extends GetConnect {
  final supabase = Supabase.instance.client;

  Future<ChatResponseModel?> getChatByIdUserAndIdExpert(ChatRequestModel? model) async {
    // Get Customer by idUser
    final response = await supabase.from('chats').select().eq('id_user', model!.idUser).eq('id_expert', model.idExpert).order('created_at', ascending: true);

    if (response.isEmpty) {
      return null;
    } else {
      return ChatResponseModel.fromJson(response);
    }
  }

  Future<bool> addChat(ChatRequestModel? model) async {
    try {
      await supabase.from('chats').insert([
        {
          'id_user': model!.idUser,
          'id_expert': model.idExpert,
          'message': model.message,
          'is_sender': model.isSender,
        }
      ]);
      return true;
    } catch (e) {
      return false;
    }
  }
}
