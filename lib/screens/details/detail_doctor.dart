// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables, unused_field
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

class DetailDoctor extends StatefulWidget {
  final int index;
  final dynamic doctorManager;
  final num rating;
  DetailDoctor({super.key, this.doctorManager, required this.rating, required this.index});

  @override
  State<DetailDoctor> createState() => _DetailDoctorState();
}

class _DetailDoctorState extends State<DetailDoctor> {
  final LoginManager loginManager = Get.find<LoginManager>();
  String selectedDate = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(),
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: colorPrimary,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Container(
                                width: Get.width,
                                color: colorPrimary,
                                child: SvgPicture.asset(
                                  'assets/svg/header_two.svg',
                                  width: Get.width,
                                  height: Get.height * 0.24,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              height: Get.height * 0.1,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    colorPrimary,
                                    colorPrimaryLight,
                                  ],
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25.0),
                                  bottomRight: Radius.circular(25.0),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              // Make Icon Button ColorPrimary With Rectangle Background White With Container
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                child: IconButton(
                                                  onPressed: () async {
                                                    // Make API Whatsapp Send Message
                                                    Get.showSnackbar(snackBarError("Anda Tidak Memiliki Akses"));
                                                  },
                                                  icon: Icon(
                                                    Icons.call,
                                                    color: colorPrimary,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                child: IconButton(
                                                  onPressed: () {
                                                    Get.showSnackbar(snackBarError("Fitur Belum Tersedia"));
                                                  },
                                                  icon: Icon(
                                                    Icons.video_chat,
                                                    color: colorPrimary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: Get.height * 0.10,
                        left: Get.height * 0.02,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: Get.height * 0.18,
                              width: Get.height * 0.14,
                              decoration: BoxDecoration(
                                color: colorPrimaryLight,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(widget.doctorManager.doctor[widget.index].avatar!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.doctorManager.doctor[widget.index].name!,
                                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: colorWhite, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.doctorManager.doctor[widget.index].specialization!,
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorWhite),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Row(
                                  children: [
                                    // Make Icon Start With ColorPrimary And Rectangle Background White With Container
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: IconButton(
                                        onPressed: () async {},
                                        icon: Icon(
                                          Icons.star,
                                          color: colorPrimary,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    // Make Text Rating
                                    Text(
                                      "${widget.rating} Skor",
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorWhite),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Get.height * 0.3, left: 10.0, right: 10.0),
                        constraints: BoxConstraints(
                          maxHeight: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          color: colorPrimaryLight,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "About",
                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: colorPrimaryDark, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '''
${widget.doctorManager.doctor[widget.index].about!}
                                    ''',
                                    textAlign: TextAlign.justify,
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorPrimaryDark),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(5, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SfCalendar(
                        view: CalendarView.month,
                        showDatePickerButton: true,
                        showCurrentTimeIndicator: true,
                        showNavigationArrow: true,
                        showWeekNumber: true,
                        onSelectionChanged: (CalendarSelectionDetails details) {
                          setState(() {
                            // convert Datetime to String
                            selectedDate = DateFormat('dd MMMM yyyy').format(details.date!);
                          });
                        },
                      ),
                    ),
                  ),
                  // Make BottomSheet With Button Book An Appointment
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                      minWidth: Get.width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // check if selectedDate is null
                          if (selectedDate.isEmpty) {
                            Get.showSnackbar(snackBarError("Silahkan pilih tanggal terlebih dahulu"));
                          } else {
                            if (DateFormat('dd MMMM yyyy').parse(selectedDate).isBefore(DateTime.now())) {
                              Get.showSnackbar(snackBarError("Tanggal yang dipilih tidak boleh kurang dari hari ini"));
                              return;
                            }

                            if (loginManager.role.value == "1" || loginManager.role.value == "1") {
                              Get.showSnackbar(snackBarError("Maaf, Anda tidak memiliki akses untuk melakukan booking, Hanya User yang dapat melakukan booking"));
                              return;
                            }
                            Get.defaultDialog(
                              title: "Konfirmasi",
                              middleText: "Apakah Anda yakin ingin melakukan booking pada tanggal $selectedDate?",
                              textConfirm: "Ya",
                              textCancel: "Tidak",
                              confirmTextColor: colorWhite,
                              cancelTextColor: colorPrimary,
                              buttonColor: colorPrimary,
                              onConfirm: () {
                                Get.back();
                                Get.showSnackbar(snackBarSuccess("Terima kasih telah melakukan booking, Silahkan tunggu konfirmasi dari dokter dan cek pada riwayat booking"));
                              },
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          "Book An Appointment",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: colorWhite),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
