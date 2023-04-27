import 'package:flutter/material.dart';
import 'package:makassar_pet_clinic/const.dart';

class PetSalonList extends StatelessWidget {
  final dynamic petBeauty;
  const PetSalonList({super.key, this.petBeauty});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: colorPrimaryLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Container(
          height: double.infinity,
          child: Icon(Icons.pets),
        ),
        title: Text(petBeauty.name ?? '', style: Theme.of(context).textTheme.titleLarge),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(petBeauty.location ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petBeauty.phone ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petBeauty.servicesOffered ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petBeauty.owner ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petBeauty.serviceCost ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
          ],
        ),
        trailing: Container(
          height: double.infinity,
          child: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
