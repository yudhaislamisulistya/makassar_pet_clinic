// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/chat_controller.dart';
import 'package:makassar_pet_clinic/controllers/rating_controller.dart';
import 'package:makassar_pet_clinic/cores/chat_manager.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';
import 'package:intl/intl.dart';
import 'package:makassar_pet_clinic/cores/rating_manager.dart';

class DetailChat extends StatefulWidget {
  final int id;
  final String title;
  const DetailChat({Key? key, required this.id, required this.title}) : super(key: key);

  @override
  _DetailChatState createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  final LoginManager loginManager = Get.find<LoginManager>();
  final ChatController chatController = Get.put(ChatController());
  final ChatManager chatManager = Get.put(ChatManager());
  final RatingController ratingController = Get.put(RatingController());
  final RatingManager ratingManager = Get.put(RatingManager());
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  late String role;
  late String roleName;
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  @override
  void initState() {
    chatManager.chat.clear();
    ratingManager.rating.clear();
    super.initState();
    Future.delayed(Duration.zero, () {
      chatController.getChatByIdUserAndIdExpert(int.parse(loginManager.idCustomer.value), widget.id);
      ratingController.getRatingByIdUserAndIdExpert(int.parse(loginManager.idCustomer.value), widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          // make star icon and show bottom sheet for rating
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Obx(
                    () {
                      if (ratingManager.isRatingLoading.value) {
                        return Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height / 4),
                            const Center(child: CircularProgressIndicator()),
                          ],
                        );
                      } else if (ratingManager.isRatingError.value) {
                        return const Center(child: Text('Error'));
                      } else if (ratingManager.isRatingEmpty.value) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10),
                            Container(
                              width: 50,
                              height: 5,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('Rating', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.star),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Konfirmasi",
                                      middleText: "Apakah Anda Ingin Memberikan Rating 1 Pada Dokter Ini?",
                                      textConfirm: "Ya",
                                      textCancel: "Tidak",
                                      confirmTextColor: colorWhite,
                                      cancelTextColor: colorPrimary,
                                      buttonColor: colorPrimary,
                                      onConfirm: () {
                                        ratingController.addRating(int.parse(loginManager.idCustomer.value), widget.id, 1);
                                      },
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.star),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Konfirmasi",
                                      middleText: "Apakah Anda Ingin Memberikan Rating 2 Pada Dokter Ini?",
                                      textConfirm: "Ya",
                                      textCancel: "Tidak",
                                      confirmTextColor: colorWhite,
                                      cancelTextColor: colorPrimary,
                                      buttonColor: colorPrimary,
                                      onConfirm: () {
                                        ratingController.addRating(int.parse(loginManager.idCustomer.value), widget.id, 2);
                                      },
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.star),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Konfirmasi",
                                      middleText: "Apakah Anda Ingin Memberikan Rating 3 Pada Dokter Ini?",
                                      textConfirm: "Ya",
                                      textCancel: "Tidak",
                                      confirmTextColor: colorWhite,
                                      cancelTextColor: colorPrimary,
                                      buttonColor: colorPrimary,
                                      onConfirm: () {
                                        ratingController.addRating(int.parse(loginManager.idCustomer.value), widget.id, 3);
                                      },
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.star),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Konfirmasi",
                                      middleText: "Apakah Anda Ingin Memberikan Rating 4 Pada Dokter Ini?",
                                      textConfirm: "Ya",
                                      textCancel: "Tidak",
                                      confirmTextColor: colorWhite,
                                      cancelTextColor: colorPrimary,
                                      buttonColor: colorPrimary,
                                      onConfirm: () {
                                        ratingController.addRating(int.parse(loginManager.idCustomer.value), widget.id, 4);
                                      },
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.star),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Konfirmasi",
                                      middleText: "Apakah Anda Ingin Memberikan Rating 5 Pada Dokter Ini?",
                                      textConfirm: "Ya",
                                      textCancel: "Tidak",
                                      confirmTextColor: colorWhite,
                                      cancelTextColor: colorPrimary,
                                      buttonColor: colorPrimary,
                                      onConfirm: () {
                                        ratingController.addRating(int.parse(loginManager.idCustomer.value), widget.id, 5);
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // text anda belum memberikan rating
                            Text('Anda belum memberikan rating', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey)),
                            const SizedBox(height: 20),
                          ],
                        );
                      } else if (ratingManager.isRatingSuccess.value) {
                        print(ratingManager.rating);
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10),
                            Container(
                              width: 50,
                              height: 5,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('Rating', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var i = 0; i < ratingManager.rating.value.first.rating; i++)
                                  IconButton(
                                    icon: const Icon(Icons.star, color: colorPrimary),
                                    onPressed: () {},
                                  ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // Text Telah Memberikan Rating
                            Text('Anda telah memberikan rating, Terimakasih', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey)),
                            const SizedBox(height: 20),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height / 4),
                            const Center(child: CircularProgressIndicator()),
                          ],
                        );
                      }
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () {
                    if (chatManager.isChatLoading.value) {
                      return Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height / 4),
                          const Center(child: CircularProgressIndicator()),
                        ],
                      );
                    } else if (chatManager.isChatError.value) {
                      return const Center(child: Text('Error'));
                    } else if (chatManager.isChatEmpty.value) {
                      return Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height / 4),
                          SvgPicture.asset('assets/svg/not_found.svg', width: 300),
                          Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                        ],
                      );
                    } else if (chatManager.isChatSuccess.value) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: chatManager.chat.length,
                        itemBuilder: (BuildContext context, int index) {
                          // DateChip(
                          //   date: now,
                          // ),
                          role = loginManager.role.value;
                          if (role == "3") {
                            roleName = "customer";
                          } else if (role == "2") {
                            roleName = "expert";
                          }

                          // Convert chatManager.chat[index].createdAt to DateTime (2021-09-01 00:00:00)
                          DateTime createdAt = DateTime.parse(chatManager.chat[index].createdAt);
                          String formattedCreatedAt = formatter.format(createdAt);

                          if (chatManager.chat[index].isSender == roleName) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                BubbleSpecialThree(
                                  text: chatManager.chat[index].message,
                                  color: colorPrimary,
                                  tail: true,
                                  textStyle: const TextStyle(color: Colors.white, fontSize: 16),
                                  sent: true,
                                  isSender: true,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 5),
                                  child: Text(formattedCreatedAt, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey)),
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BubbleSpecialThree(
                                  text: chatManager.chat[index].message,
                                  color: const Color(0xFFE8E8EE),
                                  tail: true,
                                  isSender: false,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
                                  child: Text(formattedCreatedAt, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey)),
                                ),
                              ],
                            );
                          }
                        },
                      );
                    } else {
                      return Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height / 4),
                          const Center(child: CircularProgressIndicator()),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          MessageBar(
            onSend: (text) {
              // check text is empty or not
              if (text.isEmpty) {
                Get.showSnackbar(snackBarError('Pesan Tidak Boleh Kosong'));
                return;
              } else {
                chatController.addChat(int.parse(loginManager.idCustomer.value), widget.id, text, roleName);
              }
            },
            sendButtonColor: colorPrimary,
            // change text type your message here
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
