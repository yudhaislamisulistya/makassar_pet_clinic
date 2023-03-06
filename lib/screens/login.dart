import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:makassar_pet_clinic/const.dart';
import 'package:makassar_pet_clinic/controllers/login_controller.dart';
import 'package:makassar_pet_clinic/cores/login_manager.dart';
import 'package:makassar_pet_clinic/screens/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passenable = true;
  final LoginController loginController = Get.put(LoginController());
  final LoginManager loginManager = Get.put(LoginManager());

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/svg/login.svg',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Text(
                'Sign in to continue',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Container(
                      decoration: boxDecorationPrimary.copyWith(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextField(
                        controller: usernameController,
                        style: const TextStyle(fontSize: 16),
                        cursorColor: colorPrimary,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            borderSide: BorderSide(color: colorPrimary),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                          labelText: 'Username',
                          labelStyle: TextStyle(color: colorPrimary),
                          prefixIcon: Icon(Icons.person, color: colorPrimary),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: boxDecorationPrimary.copyWith(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: passenable,
                        decoration: InputDecoration(
                          suffix: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            padding: const EdgeInsets.only(right: 10.0),
                            alignment: Alignment.center,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              setState(
                                () {
                                  if (passenable) {
                                    passenable = false;
                                  } else {
                                    passenable = true;
                                  }
                                },
                              );
                            },
                            icon: Icon(size: 16.0, color: Colors.grey, passenable == true ? Icons.remove_red_eye : Icons.password),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: colorPrimary),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: colorPrimary,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            borderSide: BorderSide(color: colorPrimary),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 45.0,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 5.0,
                          )
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
                          colors: [
                            colorPrimary,
                            colorPrimaryLight,
                          ],
                        ),
                        color: colorPrimary,
                        borderRadius: borderRadiusPrimary,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onPressed: () async {
                          // Get To Remove Back Button
                          // check username and password is empty
                          if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
                            Get.showSnackbar(snackBarError("Username atau Password Tidak Boleh Kosong"));
                            return;
                          } else {
                            await loginController.getUser(usernameController.text, passwordController.text);
                          }
                        },
                        child: Text('Login', style: Theme.of(context).textTheme.labelLarge),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Develop by',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Image(
                          image: AssetImage('assets/images/logo.png'),
                          height: 30,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
