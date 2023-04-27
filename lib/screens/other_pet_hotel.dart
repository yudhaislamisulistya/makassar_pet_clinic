import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/components/pet_hotel_list.dart';
import 'package:makassar_pet_clinic/controllers/pet_hotel_controller.dart';
import 'package:makassar_pet_clinic/cores/pet_hotel_manager.dart';

class OtherPetHotel extends StatefulWidget {
  const OtherPetHotel({super.key});

  @override
  State<OtherPetHotel> createState() => _OtherPetHotelState();
}

class _OtherPetHotelState extends State<OtherPetHotel> {
  final PetHotelController petHotelController = Get.put(PetHotelController());
  final PetHotelManager petHotelManager = Get.put(PetHotelManager());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      petHotelManager.petHotel.clear();
      petHotelController.getPetHotel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Informasi Lainnya Pet Hotel',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                if (petHotelManager.isPetHotelLoading.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (petHotelManager.isPetHotelError.value) {
                  return const Center(child: Text('Error'));
                } else if (petHotelManager.isPetHotelEmpty.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      SvgPicture.asset('assets/svg/not_found.svg', width: 300),
                      Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                    ],
                  );
                } else if (petHotelManager.isPetHotelSuccess.value) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: petHotelManager.petHotel.length,
                    itemBuilder: (context, index) {
                      return PetHotelList(
                        petHotel: petHotelManager.petHotel[index],
                      );
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
          ],
        ),
      ),
    );
  }
}
