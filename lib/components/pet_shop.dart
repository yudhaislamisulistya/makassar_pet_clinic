import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';

class PetShop extends StatelessWidget {
  // add two variable for image and text to be passed and can null
  bool isPadding;
  String title;
  String image;
  PetShop({super.key, this.isPadding = true, this.title = "-", this.image = "assets/images/pyschologist.png"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isPadding ? 20 : 0),
      child: Container(
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
                    image: AssetImage(this.image ?? 'assets/images/pyschologist.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: borderRadiusPrimary,
                ),
              ),
            ),
            Text(this.title ?? "-", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorPrimary)),
          ],
        ),
      ),
    );
  }
}
