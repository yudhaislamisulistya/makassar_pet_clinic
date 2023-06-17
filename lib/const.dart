import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/screens/login.dart';
import 'package:intl/intl.dart';

String urlSupabase = 'https://uilsyzbuczmhoqlqvuhf.supabase.co';
String anonKeySupabase = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVpbHN5emJ1Y3ptaG9xbHF2dWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzc5MzU2NDYsImV4cCI6MTk5MzUxMTY0Nn0.BNUrhNUyKrpWXujuwy8ix_GyjTfpn-MCSCZIeGalOHM';

const String appVersionDate = '2023-03-01';
const String appVersion = '1.0.0';

const Color colorPrimary = Color(0xFFFFC727);
const Color colorPrimaryLight = Color(0xFFFFF5C7);
const Color colorPrimaryDark = Color(0xFFC79A00);
const Color colorWhite = Color(0xFFFFFFFF);
const Color colorGray = Color(0xFFE0E0E0);
const Color colorGrayDark = Color(0xFF9E9E9E);
const Color colorGrayLight = Color(0xFFFAFAFA);
const Color colorSuccess = Color(0xFF4CAF50);
const Color colorError = Color(0xFFD32F2F);
const Color colorDark = Color.fromARGB(255, 26, 22, 22);

// GetSnackBar snackBarSecondary With Parameter
GetSnackBar snackBarSecondary(String message) {
  return GetSnackBar(
    title: "Info",
    message: message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: colorGrayDark,
    borderRadius: 0,
    margin: const EdgeInsets.all(0),
    snackStyle: SnackStyle.FLOATING,
    animationDuration: const Duration(milliseconds: 500),
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.easeInBack,
    isDismissible: true,
    duration: const Duration(seconds: 3),
    icon: const Icon(
      Icons.info,
      color: colorWhite,
    ),
    shouldIconPulse: true,
    mainButton: TextButton(
      onPressed: () {},
      child: const Text(
        'OK',
        style: TextStyle(color: colorWhite),
      ),
    ),
  );
}

// GetSnackBar snackBarError With Parameter
GetSnackBar snackBarError(String message) {
  return GetSnackBar(
    title: "Error",
    message: message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: colorError,
    borderRadius: 0,
    margin: const EdgeInsets.all(0),
    snackStyle: SnackStyle.FLOATING,
    animationDuration: const Duration(milliseconds: 500),
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.easeInBack,
    isDismissible: true,
    duration: const Duration(seconds: 3),
    icon: const Icon(
      Icons.error,
      color: colorWhite,
    ),
    shouldIconPulse: true,
    mainButton: TextButton(
      onPressed: () {},
      child: const Text(
        'OK',
        style: TextStyle(color: colorWhite),
      ),
    ),
  );
}

// GetSnackBar snackBarSuccess With Parameter
GetSnackBar snackBarSuccessWithAction(String message) {
  return GetSnackBar(
    title: "Success",
    message: message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: colorSuccess,
    borderRadius: 0,
    margin: const EdgeInsets.all(0),
    snackStyle: SnackStyle.FLOATING,
    animationDuration: const Duration(milliseconds: 500),
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.easeInBack,
    isDismissible: true,
    duration: const Duration(seconds: 3),
    icon: const Icon(
      Icons.check_circle,
      color: colorWhite,
    ),
    shouldIconPulse: true,
    mainButton: TextButton(
      onPressed: () {
        Get.offAll(const Login());
      },
      child: const Text(
        'OK',
        style: TextStyle(color: colorWhite),
      ),
    ),
  );
}

// GetSnackBar snackBarSuccess With Parameter
GetSnackBar snackBarSuccess(String message) {
  return GetSnackBar(
    title: "Success",
    message: message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: colorSuccess,
    borderRadius: 0,
    margin: const EdgeInsets.all(0),
    snackStyle: SnackStyle.FLOATING,
    animationDuration: const Duration(milliseconds: 500),
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.easeInBack,
    isDismissible: true,
    duration: const Duration(seconds: 3),
    icon: const Icon(
      Icons.check_circle,
      color: colorWhite,
    ),
    shouldIconPulse: true,
    mainButton: TextButton(
      onPressed: () {},
      child: const Text(
        'OK',
        style: TextStyle(color: colorWhite),
      ),
    ),
  );
}

const MaterialColor colorPrimarySwatch = MaterialColor(
  0xFFFFC727,
  <int, Color>{
    50: Color(0xFFFFF8E1),
    100: Color(0xFFFFECB3),
    200: Color(0xFFFFE082),
    300: Color(0xFFFFD54F),
    400: Color(0xFFFFCA28),
    500: Color(0xFFFFC727),
    600: Color(0xFFFFC400),
    700: Color(0xFFFFBB00),
    800: Color(0xFFFFB300),
    900: Color(0xFFFFA000),
  },
);

const BorderRadius borderRadiusPrimary = BorderRadius.all(Radius.circular(50));
const BorderRadius borderRadiusRectangle = BorderRadius.all(Radius.circular(10));

BoxDecoration boxDecorationPrimary = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(50),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(0, 3), // changes position of shadow
    ),
  ],
);

String convertToRupiah(String value) {
  final money = NumberFormat('#,##0', 'en_US');
  return 'Rp. ${money.format(int.parse(value))}';
}
