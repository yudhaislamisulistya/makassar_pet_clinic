import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/screens/details/detail_category.dart';

class Category extends StatelessWidget {
  // add two variable for image and text to be passed and can null
  final int index;
  final dynamic categoryManager;
  const Category({super.key, required this.index, this.categoryManager});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => DetailCategory(name: categoryManager.category[index].name),
        );
      },
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
                    image: AssetImage(categoryManager.category[index].avatar ?? 'assets/images/pyschologist.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: borderRadiusPrimary,
                ),
              ),
            ),
            Text(categoryManager.category[index].name ?? "-", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorPrimary)),
          ],
        ),
      ),
    );
  }
}
