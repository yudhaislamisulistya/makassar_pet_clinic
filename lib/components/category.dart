import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';

class Category extends StatelessWidget {
  // add two variable for image and text to be passed and can null
  final String? image;
  final String? text;
  const Category({super.key, this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: Get.height * 0.02),
      height: 40,
      width: 150,
      decoration: const BoxDecoration(
        color: colorWhite,
        borderRadius: borderRadiusPrimary,
        border: Border.fromBorderSide(BorderSide(color: colorPrimary)),
        boxShadow: [
          BoxShadow(
            color: colorPrimary,
            blurRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(Get.height * 0.01),
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image ?? 'assets/images/pyschologist.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: borderRadiusPrimary,
              ),
            ),
          ),
          Text(text ?? "-", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorPrimary)),
        ],
      ),
    );
  }
}
