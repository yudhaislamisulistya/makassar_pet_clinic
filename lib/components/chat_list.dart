// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/screens/details/detail_chat.dart';

class ChatList extends StatelessWidget {
  String? image;
  String? name;
  String? lastMessage;
  String? lastMessageTime;

  ChatList({super.key, this.image, this.name, this.lastMessage, this.lastMessageTime});

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
                  title: name!,
                ));
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(image ?? 'assets/images/doctor1.jpeg'),
              ),
              title: Text(name ?? "-", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: colorPrimary)),
              subtitle: Text(lastMessage ?? "-", style: Theme.of(context).textTheme.bodySmall),
              trailing: Text(lastMessageTime ?? "-", style: Theme.of(context).textTheme.bodySmall),
            ),
          ),
        ),
      ),
    );
  }
}
