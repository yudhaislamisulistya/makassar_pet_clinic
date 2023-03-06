// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:makassar_pet_clinic/const.dart';

class BookList extends StatelessWidget {
  String? title;
  String? tanggal;
  String? status;
  BookList({super.key, this.title, this.tanggal, this.status});

  @override
  Widget build(BuildContext context) {
    // Check Status Book Success, Failed, or Pending
    Color colorStatus;
    IconData iconStatus;
    if (status == "Success") {
      colorStatus = colorSuccess;
      iconStatus = Icons.check_circle;
    } else if (status == "Failed") {
      colorStatus = colorError;
      iconStatus = Icons.cancel;
    } else {
      colorStatus = colorGrayDark;
      iconStatus = Icons.pending;
    }
    return Column(
      children: [
        Container(
          decoration: boxDecorationPrimary.copyWith(
            borderRadius: BorderRadius.circular(0),
            // Add border bottom color only
          ),
          child: ListTile(
            title: Text('Dr. Yudha Islami Sulistya', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorPrimary, fontWeight: FontWeight.bold)),
            subtitle: Text('23 Maret 2023', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorGrayDark)),
            // Make Trailing With Icon Status Book
            trailing: Icon(iconStatus, color: colorStatus),
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
