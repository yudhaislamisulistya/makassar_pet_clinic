import 'package:flutter/material.dart';
import 'package:makassar_pet_clinic/const.dart';

class PetHotelList extends StatelessWidget {
  final dynamic petHotel;
  const PetHotelList({super.key, this.petHotel});

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
        title: Text(petHotel.hotelName ?? '', style: Theme.of(context).textTheme.titleLarge),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(petHotel.address ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotel.phone ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotel.email ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotel.website ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotel.operatingHours ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotel.servicesOffered ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotel.checkInTime ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petHotel.checkOutTime ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
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
