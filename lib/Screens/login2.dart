import 'package:e_bike/Screens/signup2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/AuthController.dart';
import '../utils/Color_constant.dart';
import '../utils/validator.dart';
import 'forgot password.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  bool isvisible = false;

  bool remember = false;

  var EmailController = TextEditingController();

  var PasswordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  late String email;

  late String password;

  final bool _isProgress = false;

  @override
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
        backgroundColor: ColorConstant.blueGray900,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(children: [
            Form(
                key: formkey,
                child: Column(children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Image(
                    image: AssetImage(
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
                          labelStyle: TextStyle(
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
                          controller: authController.PasswordController,
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
                      Checkbox(
                          checkColor: Colors.white,
                          value: remember,
                          onChanged: (val) {
                            setState(() {
                              remember = val!;
                            });
                          }),
                      const Text(
                        'Remeber Me',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 120.w,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => forgot()));
                          },
                          child: Text("Forgot Password?",
                              style: TextStyle(
                                  color: Colors.red, fontSize: 15.sp))),
                    ],
                  ),
                  Center(
                      child: Column(
                    children: [
                      _isProgress
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.sp),
                                  color: Colors.blue,
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
                              "Don't have an account ?",
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
                                          builder: (context) => SignUp()));
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
