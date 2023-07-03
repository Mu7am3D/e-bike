import 'package:e_bike/Screens/signup2.dart';
import 'package:flutter/material.dart';
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
        body: Column(children: [
          Form(
              key: formkey,
              child: Column(children: [
                const SizedBox(
                  height: 75,
                ),
                const Image(
                  image: AssetImage(
                    'images/rider.png',
                  ),
                  height: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Log in",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: authController.EmailController,
                    style: const TextStyle(
                      fontSize: 20,
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
                            borderRadius: BorderRadius.circular(30.0))),
                    validator: Validator.email,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (controller) => TextFormField(
                        controller: authController.PasswordController,
                        style: const TextStyle(
                          fontSize: 20,
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
                                borderRadius: BorderRadius.circular(30.0))),
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
                    const SizedBox(
                      width: 120,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => forgot()));
                        },
                        child: const Text("Forgot Password ?",
                            style: TextStyle(color: Colors.red, fontSize: 15))),
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
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blue,
                              ),
                              height: 50,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: TextButton(
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    authController.loginUser(context);
                                  }
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Don't have an account ?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: const Text("Sign up",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20))),
                        ])
                  ],
                )),
              ]))
        ]));
  }
}
