import 'package:e_bike/Screens/drawerScreens/account.dart';
import 'package:e_bike/Services/authServices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/Home_controller.dart';
import '../Constants/Color_constant.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatelessWidget {
  final AuthController authController = AuthController();
  final double width;
  final Color backgroundColor;
  AppDrawer(
      {required this.width, this.backgroundColor = ColorConstant.blueGrayy900});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: width,
      backgroundColor: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 40.w, top: 50.h),
            child: Text(
              'Settings',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.w),
            child: ListTile(
              title: Text(
                'Account',
                style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: ColorConstant.gray00,
              ),
              onTap: () => Get.to(() => Account()),
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          Divider(
            color: ColorConstant.graydiv,
            height: 0.h,
            thickness: 1.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.w, top: 15.h, bottom: 15.h),
            child: ListTile(
              title: Text(
                'Ride History',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                    color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: ColorConstant.gray00,
              ),
              onTap: () {},
            ),
          ),
          Divider(
            color: ColorConstant.graydiv,
            height: 0.h,
            thickness: 1.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.w, bottom: 15.h),
            child: GetBuilder<HomeController>(
              builder: (controller) => ListTile(
                title: Text(
                  'Notification',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
                trailing: Switch(
                  value: controller.switchControl,
                  onChanged: (value) {
                    controller.switchC();
                  },
                ),
              ),
            ),
          ),
          Divider(
            color: ColorConstant.graydiv,
            height: 0.h,
            thickness: 1.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.w, top: 15.h, bottom: 15.h),
            child: ListTile(
              title: Text(
                'Logout',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                    color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: ColorConstant.gray00,
              ),
              onTap: () {
                authController.logoutUser();
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
    );
  }
}
