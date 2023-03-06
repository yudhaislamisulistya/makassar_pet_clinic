// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/chat_controller.dart';
import 'package:makassar_pet_clinic/cores/chat_manager.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';
import 'package:makassar_pet_clinic/screens/details/detail_chat.dart';
import 'package:intl/intl.dart';

class ChatList extends StatefulWidget {
  int? id;
  String? image;
  String? name;
  String? lastMessage;
  String? lastMessageTime;

  ChatList({super.key, this.id, this.image, this.name, this.lastMessage, this.lastMessageTime});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final ChatController chatController = Get.put(ChatController());
  final ChatManager chatManager = Get.put(ChatManager());
  final LoginManager loginManager = Get.find<LoginManager>();
  // Make Format Senin, 12 April 2021 12:00:00
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  late int idCustomer;
  late int idExpert;
  late String lastMessage = '';
  late String lastMessageTime = '';

  @override
  void initState() {
    chatManager.chat.clear();
    super.initState();
    asyncMethod();
  }

  void asyncMethod() async {
    await Future.delayed(Duration.zero, () async {
      if (loginManager.role.value == "3") {
        idCustomer = int.parse(loginManager.idCustomer.value);
      } else if (loginManager.role.value == "2") {
        idCustomer = int.parse(loginManager.idExpert.value);
      }
      print("idCustomer: $idCustomer");
      print("idExpert: ${widget.id}");
      await chatController.getChatByIdUserAndIdExpert(idCustomer, widget.id!);
    });
    setState(() {
      lastMessage = chatManager.chat.isNotEmpty ? chatManager.chat.last.message ?? "" : "";
      lastMessageTime = chatManager.chat.isNotEmpty ? chatManager.chat.last.createdAt ?? "" : "";
      DateTime createdAt = DateTime.parse(lastMessageTime);
      lastMessageTime = formatter.format(createdAt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: boxDecorationPrimary.copyWith(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        elevation: 0.20,
        shadowColor: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          highlightColor: colorPrimaryLight,
          onTap: () {
            Get.to(() => DetailChat(
                  id: widget.id!,
                  title: widget.name!,
                ));
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(widget.image ?? 'assets/images/doctor1.jpeg'),
              ),
              title: Text(widget.name ?? "-", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: colorPrimary)),
              subtitle: Text(lastMessage, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
              trailing: Text(lastMessageTime, style: Theme.of(context).textTheme.bodySmall),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
