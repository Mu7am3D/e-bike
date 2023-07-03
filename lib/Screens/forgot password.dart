import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              style: TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Icon(
            Icons.lock,
            size: 75.sp,
            color: Colors.white,
          ),
          Icon(
            Icons.password,
            size: 75.sp,
            color: Colors.white,
          ),
          SizedBox(
            height: 15.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 35.sp),
                child: Text(
                  'Reset Your Password',
                  style: TextStyle(color: Colors.white, fontSize: 25.sp),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                  padding: EdgeInsets.only(left: 35.sp),
                  child: Text(
                    'Enter your email address associated with your account',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 330.w,
            child: TextFormField(
              controller: authController.Emailcontroller,
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
                  hintText: 'Enter Your Email',
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp))),
              validator: Validator.email,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 370.sp,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {
                authController.loginUser(context);
              },
              child: Text(
                "Send",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
