import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makassar_pet_clinic/bindings/app_bindings.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';
import 'package:makassar_pet_clinic/screens/home_admin.dart';
import 'package:makassar_pet_clinic/screens/home_customer_expert.dart';
import 'package:makassar_pet_clinic/screens/login.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

LoginManager loginManager = Get.put(LoginManager());
Future<void> initializeSetting() async {
  loginManager.checkLoginStatus();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Supabase.initialize(url: urlSupabase, anonKey: anonKeySupabase);
  await initializeSetting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Makassar Pet Clinic',
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        primarySwatch: colorPrimarySwatch,
      ),
      darkTheme: Get.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: loginManager.isAuthenticated.value
          ? loginManager.role.value == "1"
              ? const HomeAdmin()
              : const HomeCustomerExpert()
          : const Login(),
    );
  }
}
