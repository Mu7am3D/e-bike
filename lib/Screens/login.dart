import 'package:e_bike/Screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/AuthController.dart';
import '../utils/Color_constant.dart';
import '../utils/validator.dart';

class LoginApp1 extends StatelessWidget {
  LoginApp1({Key? key}) : super(key: key);

  bool isvisible = false;
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final bool _isProgress = false;
  @override
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
        backgroundColor: ColorConstant.blueGray900,
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Form(
              key: formkey,
              child: Column(children: [
                SizedBox(
                  height: 75.h,
                ),
                Image(
                  image: AssetImage(
                    'images/rider.png',
                  ),
                  height: 100.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Login to your account",
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: TextFormField(
                    controller: authController.EmailController,
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
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.sp))),
                    validator: Validator.email,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (controller) => TextFormField(
                        controller: authController.PasswordController,
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !controller.isvisible,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
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
                                borderRadius: BorderRadius.circular(30.sp))),
                        validator: Validator.password,
                      ),
                    )),
                Center(
                    child: Column(
                  children: [
                    _isProgress
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: double.maxFinite,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.sp),
                                color: Colors.red,
                              ),
                              height: 50.h,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              child: TextButton(
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    authController.loginUser(context);
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 20.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "You do not have an account ?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp1()));
                              },
                              child: Text("Sign up",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20.sp))),
                        ])
                  ],
                )),
              ]))
        ]));
  }
}
