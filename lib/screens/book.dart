import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/components/book_list.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/booking_controller.dart';
import 'package:makassar_pet_clinic/cores/booking_manager.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  final BookingController bookingController = Get.put(BookingController());
  final BookingManager bookingManager = Get.put(BookingManager());
  final LoginManager loginManager = Get.find<LoginManager>();
  late int idCustomer;

  @override
  void initState() {
    bookingManager.booking.clear();
    super.initState();
    asyncMethod();
  }

  void asyncMethod() async {
    Future.delayed(Duration.zero, () {
      if (loginManager.role.value == "3") {
        idCustomer = int.parse(loginManager.idCustomer.value);
      } else if (loginManager.role.value == "2") {
        idCustomer = int.parse(loginManager.idExpert.value);
      }
      bookingController.getBookingRelatedToExpertByIdUser(idCustomer, null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          title: Text('Book History', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  colorPrimary,
                  colorPrimaryDark,
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () {
                  if (bookingManager.isBookingLoading.value) {
                    return Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height / 4),
                        const Center(child: CircularProgressIndicator()),
                      ],
                    );
                  } else if (bookingManager.isBookingError.value) {
                    return const Center(child: Text('Error'));
                  } else if (bookingManager.isBookingEmpty.value) {
                    return Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height / 4),
                        SvgPicture.asset('assets/svg/not_found.svg', width: 300),
                        Center(child: Text('Data Tidak Tersedia', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey))),
                      ],
                    );
                  } else if (bookingManager.isBookingSuccess.value) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: bookingManager.booking.length,
                      itemBuilder: (BuildContext context, int index) {
                        String? status;
                        if (bookingManager.booking[index].status == '1') {
                          status = 'Pending';
                        } else if (bookingManager.booking[index].status == '2') {
                          status = 'Success';
                        } else {
                          status = 'Cencel';
                        }

                        dynamic name;

                        if (loginManager.role.value == "3") {
                          name = bookingManager.booking[index].experts.name;
                        } else if (loginManager.role.value == "2") {
                          name = bookingManager.booking[index].customers.name;
                        }
                        return BookList(
                          id: bookingManager.booking[index].id,
                          idUser: bookingManager.booking[index].idUser,
                          idExpert: bookingManager.booking[index].experts.id,
                          name: name,
                          dateBook: bookingManager.booking[index].dateBook,
                          status: status,
                          bookManager: bookingManager.booking[index],
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
