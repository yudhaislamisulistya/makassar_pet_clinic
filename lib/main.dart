import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makassar_pet_clinic/bindings/app_bindings.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';
import 'package:makassar_pet_clinic/screens/home.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        primarySwatch: colorPrimarySwatch,
      ),
      home: loginManager.isAuthenticated.value ? const Home() : const Login(),
    );
  }
}
