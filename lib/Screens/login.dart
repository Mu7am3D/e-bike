import 'package:e_bike/Screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/AuthController.dart';
import '../utils/Color_constant.dart';
import '../utils/validator.dart';

class LoginApp1 extends StatelessWidget {
  LoginApp1({Key? key}) : super(key: key);


  bool isvisible = false;
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool _isProgress = false;
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
                const SizedBox(height: 75,),
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
                  "Login to your account",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
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
                        labelStyle: TextStyle(color: Colors.white),
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
                            labelStyle: TextStyle(color: Colors.white),
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
                Center(
                    child: Column(
                      children: [
                        _isProgress
                            ? const CircularProgressIndicator()
                            :
                        SizedBox(
                          width: double.maxFinite,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red,
                            ),
                            height: 50,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextButton(
                              onPressed: ()
                              async {
                                if (formkey.currentState!.validate()) {
                                  authController.loginUser();

                                }
                              }
                              ,
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
                                "You do not have an account ?",
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
                                            builder: (context) => SignUp1()));
                                  },
                                  child: const Text("Sign up",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 20))),
                            ])
                      ],
                    )),
              ]))
        ])
    );
  }

}
