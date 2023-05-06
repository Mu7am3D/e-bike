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
          Center(
            child: Text(
              'Forgot Password ?',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Icon(
            Icons.lock,
            size: 75,
            color: Colors.white,
          ),
          Icon(
            Icons.password,
            size: 75,
            color: Colors.white,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              padding: EdgeInsets.only(right: 130),
              child: Text(
                'Reset Your Password',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          SizedBox(height: 20,),
          Container(padding: EdgeInsets.only(left: 35),
              child: Text(
            'Enter your email address associated with your account',
            style: TextStyle(color: Colors.white, fontSize: 17),
          )),
          SizedBox(height: 20,),
          Container(
            width: 330,
            child: TextFormField(
              controller: authController.Emailcontroller,style: const TextStyle(
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
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0))),
              validator: Validator.email,
            ),
          ),
          SizedBox(height: 20,),
          Container(width: 330,
            child: TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {
                  authController.loginUser();
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
