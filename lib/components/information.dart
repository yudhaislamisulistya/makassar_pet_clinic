import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/information_controller.dart';
import 'package:makassar_pet_clinic/main.dart';

class Information extends StatelessWidget {
  final int index;
  final dynamic informationManager;
  const Information({super.key, required this.informationManager, required this.index});

  @override
  Widget build(BuildContext context) {
    final InformationController informationController = Get.put(InformationController());

    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController categoryController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadiusRectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: const Icon(
            Icons.info_outline,
            size: 25,
            color: colorPrimary,
          ),
          subtitle: Text(informationManager.information[index].description ?? '', maxLines: 20, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey)),
          title: Text(informationManager.information[index].name),
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
                        title: 'Delete Information',
                        middleText: 'Are you sure want to delete this information?',
                        textConfirm: 'Yes',
                        textCancel: 'No',
                        confirmTextColor: Colors.white,
                        cancelTextColor: colorError,
                        buttonColor: colorError,
                        onConfirm: () {
                          informationController.deleteInformation(informationManager.information[index].id);
                        },
                      );
                    },
                    child: const Icon(Icons.delete, size: 15),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      // make bottom sheet for edit information
                      nameController.text = informationManager.information[index].name;
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
                                  Text('Update Information', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                        labelText: 'Information Name',
                                        border: OutlineInputBorder(
                                          borderRadius: borderRadiusPrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: descriptionController,
                                      decoration: InputDecoration(
                                        hintText: 'Description',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      // make field dont edit
                                      enabled: false,
                                      controller: categoryController,
                                      decoration: InputDecoration(
                                        hintText: 'Information',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      informationController.updateInformation(informationManager.information[index].id, nameController.text, descriptionController.text, categoryController.text);
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
      ),
    );
  }
}
