import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/category_controller.dart';

class CategoryList extends StatelessWidget {
  final int index;
  final dynamic categoryManager;
  const CategoryList({super.key, required this.categoryManager, required this.index});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    TextEditingController nameController = TextEditingController();

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
          leading: Padding(
            padding: EdgeInsets.all(Get.height * 0.01),
            child: Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pyschologist.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: borderRadiusPrimary,
              ),
            ),
          ),
          title: Text(categoryManager.category[index].name),
          trailing: SizedBox(
            width: 150,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const InkWell(child: Icon(Icons.arrow_forward_ios, size: 15)),
                const SizedBox(width: 8),
                InkWell(
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Delete Category',
                        middleText: 'Are you sure want to delete this category?',
                        textConfirm: 'Yes',
                        textCancel: 'No',
                        confirmTextColor: Colors.white,
                        cancelTextColor: colorError,
                        buttonColor: colorError,
                        onConfirm: () {
                          categoryController.deleteCategory(categoryManager.category[index].id);
                        },
                      );
                    },
                    child: const Icon(Icons.delete, size: 15)),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    // make bottom sheet for edit category
                    nameController.text = categoryManager.category[index].name;
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
                                Text('Update Category', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      labelText: 'Category Name',
                                      border: OutlineInputBorder(
                                        borderRadius: borderRadiusPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    categoryController.updateCategory(categoryManager.category[index].id, nameController.text);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
