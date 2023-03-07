// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/booking_controller.dart';
import 'package:makassar_pet_clinic/controllers/chat_controller.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';

class BookList extends StatefulWidget {
  int? id;
  int? idUser;
  int? idExpert;
  String? name;
  String? dateBook;
  String? status;
  dynamic bookManager;
  BookList({super.key, this.id, this.idUser, this.idExpert, this.name, this.dateBook, this.status, this.bookManager});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final LoginManager loginManager = Get.put(LoginManager());
  final BookingController bookingController = Get.put(BookingController());
  final ChatController chatController = Get.put(ChatController());
  TextEditingController descriptionController = TextEditingController();
  late int idCustomer;

  @override
  Widget build(BuildContext context) {
    // Check Status Book Success, Failed, or Pending
    Color colorStatus;
    IconData iconStatus;
    if (widget.status == "Success") {
      colorStatus = colorSuccess;
      iconStatus = Icons.check_circle;
    } else if (widget.status == "Cencel") {
      colorStatus = colorError;
      iconStatus = Icons.cancel;
    } else {
      colorStatus = colorGrayDark;
      iconStatus = Icons.pending;
    }

    if (loginManager.role.value == "3") {
      idCustomer = int.parse(loginManager.idCustomer.value);
    } else if (loginManager.role.value == "2") {
      idCustomer = int.parse(loginManager.idExpert.value);
    }
    return Column(
      children: [
        Container(
          decoration: boxDecorationPrimary.copyWith(
            borderRadius: BorderRadius.circular(0),
            // Add border bottom color only
          ),
          child: Material(
            elevation: 0.20,
            shadowColor: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10.0),
            child: InkWell(
              highlightColor: colorPrimaryLight,
              onTap: () {
                if (widget.status == "Cencel") {
                  Get.showSnackbar(snackBarError("Maaf, Anda tidak dapat mengakses detail bookingan yang telah dibatalkan"));
                } else if (widget.status == "Pending") {
                  if (loginManager.role.value == "3") {
                    Get.showSnackbar(snackBarSecondary("Maaf, Anda tidak dapat mengakses detail bookingan yang masih dalam proses diterima oleh dokter"));
                  } else if (loginManager.role.value == "2") {
                    Get.defaultDialog(
                      title: 'Confirm',
                      middleText: 'Are you sure you want to accept or reject this booking?',
                      textConfirm: 'Aceept',
                      textCancel: 'Reject',
                      confirmTextColor: Colors.white,
                      cancelTextColor: colorPrimary,
                      buttonColor: colorPrimary,
                      // make textfield descripton
                      content: Column(
                        children: [
                          // Are you sure you want to accept or reject this booking
                          Text(
                            'Are you sure you want to accept or reject this booking?',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorGrayDark, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: descriptionController,
                            decoration: const InputDecoration(
                              labelText: 'Description',
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius: borderRadiusPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onConfirm: () {
                        bookingController.updateBooking(idCustomer, widget.id!, "2", descriptionController.text);
                        chatController.addChat(widget.idUser!, widget.idExpert!, "Hai, Ada yang bisa saya bantu?", "expert");
                      },
                      onCancel: () {
                        bookingController.updateBooking(idCustomer, widget.id!, "3", descriptionController.text);
                      },
                    );
                  }
                } else {
                  Get.showSnackbar(snackBarSuccess("Silahkan ke halaman chat untuk melakukan konsultasi"));
                }
              },
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                isThreeLine: true,
                title: Text(widget.name ?? '-', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorPrimary, fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.dateBook ?? '-', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorGrayDark)),
                    Text(widget.status ?? '-', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorStatus)),
                    if (loginManager.role.value == "2") ...[
                      Text(widget.bookManager.customers.petType ?? '-', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorGrayDark)),
                      Text(widget.bookManager.customers.petName ?? '-', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorGrayDark)),
                      Text(widget.bookManager.customers.petAge ?? '-', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorGrayDark)),
                      Text(widget.bookManager.customers.petGender ?? '-', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorGrayDark)),
                    ],
                    if (widget.status == "Success") ...[
                      if (loginManager.role.value == "3") ...[
                        Text("Silahkan Konsultasi", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorPrimary)),
                      ]
                    ]
                  ],
                ),
                // Make Trailing With Icon Status Book
                trailing: Icon(iconStatus, color: colorStatus),
              ),
            ),
          ),
        ),
        const Divider(
          color: colorPrimary,
          thickness: 1,
          height: 2,
        ),
      ],
    );
  }
}
