import 'package:flutter/material.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/controllers/pet_beauty_controller.dart';
import 'package:makassar_pet_clinic/main.dart';

class PetSalonList extends StatelessWidget {
  final int index;
  final dynamic petBeautyManager;
  const PetSalonList({super.key, required this.index, required this.petBeautyManager});

  @override
  Widget build(BuildContext context) {
    final PetBeautyController petBeautyController = Get.put(PetBeautyController());

    TextEditingController nameController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController serviceOfferedController = TextEditingController();
    TextEditingController ownerController = TextEditingController();
    TextEditingController serviceCostController = TextEditingController();

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
        title: Text(petBeautyManager.petBeauty[index].name ?? '', style: Theme.of(context).textTheme.titleLarge),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(petBeautyManager.petBeauty[index].location ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petBeautyManager.petBeauty[index].phone ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petBeautyManager.petBeauty[index].servicesOffered ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(petBeautyManager.petBeauty[index].owner ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
            Text(convertToRupiah(petBeautyManager.petBeauty[index].serviceCost), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorDark, fontSize: 12.0)),
          ],
        ),
        trailing: SizedBox(
          width: 150,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (loginManager.role.value == "1") ...[
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: 'Delete Pet Salon',
                      middleText: 'Are you sure want to delete this Pet Salon?',
                      textConfirm: 'Yes',
                      textCancel: 'No',
                      confirmTextColor: Colors.white,
                      cancelTextColor: colorError,
                      buttonColor: colorError,
                      onConfirm: () {
                        petBeautyController.deletePetBeauty(petBeautyManager.petBeauty[index].id);
                      },
                    );
                  },
                  child: const Icon(Icons.delete, size: 15),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    nameController.text = petBeautyManager.petBeauty[index].name;
                    locationController.text = petBeautyManager.petBeauty[index].location;
                    phoneController.text = petBeautyManager.petBeauty[index].phone;
                    serviceOfferedController.text = petBeautyManager.petBeauty[index].servicesOffered;
                    ownerController.text = petBeautyManager.petBeauty[index].owner;
                    serviceCostController.text = petBeautyManager.petBeauty[index].serviceCost.toString();
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 10),
                                Container(
                                  width: 50,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text('Update Pet Salon', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    // controller: nameController,
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: 'Name',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      hintStyle: const TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                // Make TextField for description
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: locationController,
                                    decoration: InputDecoration(
                                      hintText: 'Location',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      hintStyle: const TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: phoneController,
                                    decoration: InputDecoration(
                                      hintText: 'Phone',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      hintStyle: const TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: serviceOfferedController,
                                    decoration: InputDecoration(
                                      hintText: 'Service Offered',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      hintStyle: const TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: ownerController,
                                    decoration: InputDecoration(
                                      hintText: 'Owner',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      hintStyle: const TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: serviceCostController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: 'Service Cost',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                      hintStyle: const TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    if (nameController.text.isEmpty) {
                                      Get.back();
                                      Get.showSnackbar(snackBarError("Name is required"));
                                      return;
                                    } else if (locationController.text.isEmpty) {
                                      Get.back();
                                      Get.showSnackbar(snackBarError("Location is required"));
                                      return;
                                    } else if (phoneController.text.isEmpty) {
                                      Get.back();
                                      Get.showSnackbar(snackBarError("Phone is required"));
                                      return;
                                    } else if (serviceOfferedController.text.isEmpty) {
                                      Get.back();
                                      Get.showSnackbar(snackBarError("Service Offered is required"));
                                      return;
                                    } else if (ownerController.text.isEmpty) {
                                      Get.back();
                                      Get.showSnackbar(snackBarError("Owner is required"));
                                      return;
                                    } else if (serviceCostController.text.isEmpty) {
                                      Get.back();
                                      Get.showSnackbar(snackBarError("Service Cost is required"));
                                      return;
                                    } else {
                                      petBeautyController.updatePetBeauty(petBeautyManager.petBeauty[index].id, nameController.text, locationController.text, phoneController.text, serviceOfferedController.text, ownerController.text, serviceCostController.text);

                                      nameController.clear();
                                      locationController.clear();
                                      serviceOfferedController.clear();
                                      phoneController.clear();
                                      ownerController.clear();
                                      serviceCostController.clear();
                                    }
                                  },
                                  child: Text('Update', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.edit, size: 15),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
