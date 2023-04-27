import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/components/pet_salon_list.dart';
import 'package:makassar_pet_clinic/controllers/pet_beauty_controller.dart';
import 'package:makassar_pet_clinic/cores/pet_beuaty_manager.dart';

class OtherPetBeauty extends StatefulWidget {
  const OtherPetBeauty({super.key});

  @override
  State<OtherPetBeauty> createState() => _OtherPetBeautyState();
}

class _OtherPetBeautyState extends State<OtherPetBeauty> {
  final PetBeautyController petBeautyController = Get.put(PetBeautyController());
  final PetBeautyManager petBeautyManager = Get.put(PetBeautyManager());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      petBeautyManager.petBeauty.clear();
      petBeautyController.getPetBeauty();
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
          'Informasi Lainnya Pet Salon',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                if (petBeautyManager.isPetBeautyLoading.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (petBeautyManager.isPetBeautyError.value) {
                  return const Center(child: Text('Error'));
                } else if (petBeautyManager.isPetBeautyEmpty.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      SvgPicture.asset('assets/svg/not_found.svg', width: 300),
                      Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                    ],
                  );
                } else if (petBeautyManager.isPetBeautySuccess.value) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: petBeautyManager.petBeauty.length,
                    itemBuilder: (context, index) {
                      return PetSalonList(
                        petBeauty: petBeautyManager.petBeauty[index],
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
