import 'package:flutter/material.dart';
import 'package:makassar_pet_clinic/components/book_list.dart';
import 'package:makassar_pet_clinic/components/chat_list.dart';
import 'package:makassar_pet_clinic/const.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          title: Text('Chat History', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  colorPrimary,
                  colorPrimaryDark,
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ChatList(
                name: 'Dr. M. Kamil',
                image: 'assets/images/doctor1.jpeg',
                lastMessage: 'Hello, I want to ask about my dog',
                lastMessageTime: '12:00',
              ),
              ChatList(
                name: 'Dr. M. Kamil',
                image: 'assets/images/doctor1.jpeg',
                lastMessage: 'Hello, I want to ask about my dog',
                lastMessageTime: '12:00',
              ),
              ChatList(
                name: 'Dr. M. Kamil',
                image: 'assets/images/doctor1.jpeg',
                lastMessage: 'Hello, I want to ask about my dog',
                lastMessageTime: '12:00',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
