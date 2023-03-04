import 'package:flutter/material.dart';
import 'package:makassar_pet_clinic/const.dart';

class Doctor extends StatelessWidget {
  final String? image;
  final String? name;
  final String? specialist;
  final num rating;
  const Doctor({super.key, this.image, this.name, this.specialist, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: colorPrimary,
            borderRadius: borderRadiusRectangle,
            image: DecorationImage(
              image: AssetImage(image ?? 'assets/images/doctor1.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(name ?? '-', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorPrimary, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialist ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorGrayDark)),
            // Give Star Rating With Icon and condition
            Row(
              children: [
                // if rating is null, show 0 star
                if (rating != null) ...[
                  for (var i = 0; i < rating; i++)
                    const Icon(
                      Icons.star,
                      color: colorPrimary,
                      size: 15,
                    ),
                  // if rating is not null, show star rating
                ]
              ],
            )
          ],
        ),
        trailing: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.arrow_forward_ios,
            color: colorGrayDark,
          ),
        ),
      ),
    );
  }
}
