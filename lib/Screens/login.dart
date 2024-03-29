import 'package:e_bike/Screens/forgotPassword.dart';
import 'package:e_bike/Screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Services/authServices.dart';
import '../Constants/Color_constant.dart';
import '../helpers/validator.dart';

AuthController _authController = AuthController();

class LoginApp extends GetView<AuthController> {
  final _formkey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.blueGray900,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(children: [
            Form(
                key: _formkey1,
                child: Column(children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Image(
                    image: const AssetImage(
                      'images/rider.png',
                    ),
                    height: 100.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Log in",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _authController.EmailController,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp))),
                      validator: Validator.email,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GetBuilder<AuthController>(
                        init: AuthController(),
                        builder: (controller) => TextFormField(
                          controller: _authController.PasswordController,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !controller.isvisible,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              labelText: 'password',
                              labelStyle: const TextStyle(color: Colors.white),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.visible();
                                  },
                                  icon: controller.isvisible
                                      ? const Icon(
                                          Icons.visibility,
                                          color: Colors.white,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: Colors.white,
                                        )),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.sp))),
                          validator: Validator.password,
                        ),
                      )),
                  Row(
                    children: [
                      GetBuilder<AuthController>(
                          builder: (controller) => Checkbox(
                                checkColor: Colors.white,
                                value: controller.rememberMe,
                                onChanged: (val) {
                                  controller.setRememberMe(val!);
                                  controller.remember();
                                  print(controller.rememberMe);
                                },
                              )),
                      const Text(
                        'Remeber Me',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 120.w,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => Forgot());
                          },
                          child: Text("Forgot Password?",
                              style: TextStyle(
                                  color: Colors.red, fontSize: 15.sp))),
                    ],
                  ),
                  Center(
                      child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp),
                            color: Colors.blue,
                          ),
                          height: 50.h,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          child: GetBuilder<AuthController>(
                              builder: (controller) => TextButton(
                                    child: controller.isLoading
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ))
                                        : Text(
                                            "Login",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                    onPressed: () async {
                                      if (_formkey1.currentState!.validate()) {
                                        controller.loading();
                                        await _authController
                                            .loginUser(context);
                                        controller.loading();
                                      }
                                    },
                                  )),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account ?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => SignUp());
                                },
                                child: Text("Sign up",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 20.sp))),
                          ])
                    ],
                  )),
                ]))
          ]),
        ));
  }
}
