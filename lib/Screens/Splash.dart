import 'dart:async';

import 'package:e_bike/Nav%20Bar/Nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../Services/authServices.dart';
import '../Constants/Color_constant.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController _authController = Get.put(AuthController());

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      checkRememberMeAndNavigate();
    });

    super.initState();
  }

  Future<void> checkRememberMeAndNavigate() async {
    await _authController.checkRememberMe();

    if (_authController.rememberMe) {
      // User is remembered, navigate to the home page
      Get.offAll(() => Nav());
    } else {
      // User is not remembered, navigate to the login page
      Get.offAll(() => LoginApp());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: const Alignment(0.5, 0),
                end: const Alignment(0.5, 1),
                colors: [
              ColorConstant.blueGray900,
              ColorConstant.blue800,
              ColorConstant.indigo900
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset('images/img_shape.svg')),
            const SizedBox(
              height: 150,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            )
          ],
        ),
      ),
    ));
  }
}
