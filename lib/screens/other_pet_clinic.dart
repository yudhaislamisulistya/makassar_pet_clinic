import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/components/pet_clinic_list.dart';
import 'package:makassar_pet_clinic/controllers/pet_clinic_controller.dart';
import 'package:makassar_pet_clinic/cores/pet_clinic_manager.dart';

class OtherPetClinic extends StatefulWidget {
  const OtherPetClinic({super.key});

  @override
  State<OtherPetClinic> createState() => _OtherPetClinicState();
}

class _OtherPetClinicState extends State<OtherPetClinic> {
  final PetClinicController petClinicController = Get.put(PetClinicController());
  final PetClinicManager petClinicManager = Get.put(PetClinicManager());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      petClinicManager.petClinic.clear();
      petClinicController.getPetClinic();
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
          'Informasi Lainnya Pet Klinik',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                if (petClinicManager.isPetClinicLoading.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (petClinicManager.isPetClinicError.value) {
                  return const Center(child: Text('Error'));
                } else if (petClinicManager.isPetClinicEmpty.value) {
                  return Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                      SvgPicture.asset('assets/svg/not_found.svg', width: 300),
                      Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                    ],
                  );
                } else if (petClinicManager.isPetClinicSuccess.value) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: petClinicManager.petClinic.length,
                    itemBuilder: (context, index) {
                      return PetClinicList(
                        petClinic: petClinicManager.petClinic[index],
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
