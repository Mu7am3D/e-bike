import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/AuthController.dart';
import '../Constants/Color_constant.dart';
import '../Controller/Profile_controller.dart';
import '../utils/validator.dart';

class ProfileView extends GetView<ProfileController> {
  AuthController _authController = AuthController();
  ProfileView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return SafeArea(
        child: Obx(
      () => BlurryModalProgressHUD(
          inAsyncCall: controller.isLoading.value,
          blurEffectIntensity: 3,
          child: Scaffold(
            backgroundColor: ColorConstant.blueGray900,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40.w, top: 10.h),
                    child: Text(
                      'Profile',
                      style: GoogleFonts.inter(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Container(
                      child: CircleAvatar(
                        backgroundColor: ColorConstant.blueGray900,
                        backgroundImage: const AssetImage('images/ppic.png'),
                        radius: 50.sp,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 15.h, bottom: 10.h, left: 30.w),
                    child: GetBuilder<ProfileController>(
                        builder: (controller) => ListTile(
                              title: Text(
                                'Name :',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24.sp,
                                    color: Colors.white),
                              ),
                              trailing: Container(
                                  padding: EdgeInsets.only(right: 40.w),
                                  child: Text(
                                    controller.name,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  )),
                              onTap: () {},
                            )),
                  ),
                  Divider(
                    color: ColorConstant.graydiv,
                    height: 0.h,
                    thickness: 1.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 15.h, bottom: 10.h, left: 30.w),
                    child: GetBuilder<ProfileController>(
                        builder: (controller) => ListTile(
                              title: Text(
                                'E-mail :',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24.sp,
                                    color: Colors.white),
                              ),
                              trailing: Container(
                                padding: EdgeInsets.only(right: 35.w),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    controller.email,
                                    maxLines: 1,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              onTap: () {},
                            )),
                  ),
                  Divider(
                    color: ColorConstant.graydiv,
                    height: 0.h,
                    thickness: 1.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 30.w, bottom: 10.h, top: 15.h),
                    child: ListTile(
                      title: Text(
                        'Change Password',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 24.sp,
                            color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorConstant.gray00,
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => Center(
                                  child: AlertDialog(
                                    backgroundColor: ColorConstant.blackgray,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.sp))),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Form(
                                            key: _formKey,
                                            child: Column(
                                              children: [
                                                Center(
                                                    child: TextFormField(
                                                  obscureText: true,
                                                  controller: _authController
                                                      .PasswordController,
                                                  style: TextStyle(
                                                      fontSize: 24.sp),
                                                  validator: Validator.password,
                                                )),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  width: double.maxFinite,
                                                  child: Container(
                                                    height: 50.h,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 10.w,
                                                      vertical: 10.h,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.sp),
                                                      color: Colors.blue,
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () async {
                                                        if (_formKey
                                                            .currentState!
                                                            .validate()) {
                                                          _authController
                                                              .changePassword(
                                                                  "${_authController.PasswordController.text}");
                                                        }
                                                      },
                                                      child: Text(
                                                        "Submit",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 25.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                    ],
                                    title: Text(
                                      "Change Your Password",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                    ),
                                    content: Text(
                                      "Enter 6 charachter at least",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                    ),
                                  ),
                                ));
                      },
                    ),
                  ),
                  Divider(
                    color: ColorConstant.graydiv,
                    height: 0.h,
                    thickness: 1.h,
                  ),
                ],
              ),
            ),
          )),
    ));
  }
}
