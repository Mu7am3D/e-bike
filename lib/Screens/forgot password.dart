import 'package:flutter/material.dart';

import '../utils/AuthController.dart';
import '../utils/Color_constant.dart';
import '../utils/validator.dart';

class forgot extends StatelessWidget {
  forgot({Key? key}) : super(key: key);
  var EmailController = TextEditingController();
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
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'Forgot Password ?',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Icon(
            Icons.lock,
            size: 75,
            color: Colors.white,
          ),
          const Icon(
            Icons.password,
            size: 75,
            color: Colors.white,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              padding: const EdgeInsets.only(right: 130),
              child: const Text(
                'Reset Your Password',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.only(left: 35),
              child: const Text(
                'Enter your email address associated with your account',
                style: TextStyle(color: Colors.white, fontSize: 17),
              )),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 330,
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
                  hintText: 'Enter Your Email',
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0))),
              validator: Validator.email,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 330,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {
                authController.loginUser(context);
              },
              child: const Text(
                "Send",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
