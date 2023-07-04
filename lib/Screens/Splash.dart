import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Nav Bar/Nav_bar.dart';
import '../utils/Color_constant.dart';
import 'login2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  _init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("userID");
    if (token != null) {
      print('Token: $token');
      Get.offAll(() => const Nav());
    } else {
      Get.offAll(() => LoginApp());
    }
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      _init();
    });

    super.initState();
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
