import 'package:flutter/material.dart';
import '../utils/AuthController.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/Color_constant.dart';
import '../utils/validator.dart';
import 'login.dart';

AuthController _authController = AuthController();

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  static final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.blueGray900,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Text(
                "Create an account",
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _authController.fNamecontroller,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelText: 'First Name',
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp))),
                  validator: Validator.name,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: TextFormField(
                  controller: _authController.lNamecontroller,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelText: 'Last Name',
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp))),
                  validator: Validator.name,
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: TextFormField(
                    controller: _authController.Emailcontroller,
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
                            borderRadius: BorderRadius.circular(10.sp))),
                    validator: Validator.email,
                  )),
              Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: GetBuilder<AuthController>(
                    init: AuthController(),
                    builder: (controller) => TextFormField(
                      controller: _authController.Passwordcontroller,
                      obscureText: !controller.isvisible,
                      style: TextStyle(
                        fontSize: 20.sp,
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
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp))),
                      validator: Validator.password,
                    ),
                  )),
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
                              horizontal: 10.w, vertical: 10.h),
                          child: GetBuilder<AuthController>(
                              builder: (controller) => TextButton(
                                  child: controller.isLoading
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ))
                                      : Text(
                                          "SignUp",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.sp,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                  onPressed: () async {
                                    if (formkey.currentState!.validate()) {
                                      controller.loading();
                                      await _authController
                                          .createAccount(context);
                                      controller.loading();
                                    }
                                  })))),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => LoginApp());
                          },
                          child: Text("Login",
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 20.sp))),
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
