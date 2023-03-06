import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/components/category_list.dart' as category_list_component;
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/category_controller.dart';
import 'package:makassar_pet_clinic/cores/category_manager.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final CategoryController categoryController = Get.put(CategoryController());
  final CategoryManager categoryManager = Get.put(CategoryManager());
  final LoginManager loginManager = Get.put(LoginManager());

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    categoryManager.category.clear();
    categoryController.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text('Category', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          elevation: 0,
          actions: <Widget>[
            if (loginManager.role.value == '1') ...[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  // Make Bottom Sheet
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
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
                              Text('Add Category', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: colorPrimary)),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: 'Category Name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () async {
                                  if (nameController.text.isEmpty) {
                                    Get.back();
                                    Get.snackbar('Error', 'Category name is required');
                                    return;
                                  } else {
                                    categoryController.addCategory(nameController.text);
                                  }
                                },
                                child: Text('Save', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ]
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // make obx with if statement
              Obx(
                () {
                  if (categoryManager.isCategoryLoading.value) {
                    return Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height / 4),
                        const Center(child: CircularProgressIndicator()),
                      ],
                    );
                  } else if (categoryManager.isCategoryError.value) {
                    return const Center(child: Text('Error'));
                  } else if (categoryManager.isCategoryEmpty.value) {
                    return Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height / 4),
                        SvgPicture.asset('assets/svg/not_found.svg', width: 300),
                        Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                      ],
                    );
                  } else if (categoryManager.isCategorySuccess.value) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categoryManager.category.length,
                      itemBuilder: (BuildContext context, int index) {
                        return category_list_component.CategoryList(
                          index: index,
                          categoryManager: categoryManager,
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
      ),
    );
  }
}
