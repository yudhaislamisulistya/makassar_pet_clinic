import 'package:flutter/material.dart';
import 'package:makassar_pet_clinic/const.dart';

class PetClinicList extends StatelessWidget {
  final dynamic petClinic;
  const PetClinicList({super.key, this.petClinic});

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
          child: Icon(Icons.cleaning_services),
        ),
        title: Text(petClinic.clinicName ?? '', style: Theme.of(context).textTheme.titleLarge),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(petClinic.address ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petClinic.phone ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petClinic.email ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petClinic.website ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petClinic.operatingHours ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petClinic.servicesOffered ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petClinic.facilities ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
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
