// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:makassar_pet_clinic/const.dart';

class DetailChat extends StatefulWidget {
  final String title;
  const DetailChat({Key? key, required this.title}) : super(key: key);

  @override
  _DetailChatState createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                DateChip(
                  date: now,
                ),
                const BubbleSpecialThree(
                  text: 'Apakah saya bisa konsultasi dengan anda?',
                  color: colorPrimary,
                  tail: true,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  delivered: false,
                  sent: true,
                ),
                const BubbleSpecialThree(
                  text: "Yah, silahkan tanya saja",
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  isSender: false,
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          MessageBar(
            onSend: (text) {
              print(text);
            },
            sendButtonColor: colorPrimary,
            // change text type your message here
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
