import 'package:flutter/material.dart';
import '../utils/AuthController.dart';
import 'package:get/get.dart';

import '../utils/Color_constant.dart';
import '../utils/validator.dart';
import 'login.dart';

class SignUp1 extends StatelessWidget {
  SignUp1({Key? key}) : super(key: key);
  final formkey = GlobalKey<FormState>();
  bool _isProgress = false;

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      backgroundColor: ColorConstant.blueGray900,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
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
                "Create Your Account",
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
                  controller: authController.Namecontroller,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelText: 'Full Name',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  validator: Validator.name,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: authController.Emailcontroller,
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
                  )),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GetBuilder<AuthController>(
                    init: AuthController(),
                    builder: (controller) => TextFormField(
                      controller: authController.Passwordcontroller,
                      obscureText: !controller.isvisible,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
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
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
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
                      : SizedBox(
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
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    authController.createAccount(context);
                                  }
                                },
                                child: const Text(
                                  "SignUp",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ))),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Do you have an account ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => LoginApp1());
                          },
                          child: const Text("Login",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 20))),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
