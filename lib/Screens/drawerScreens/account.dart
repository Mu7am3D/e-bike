import 'package:e_bike/Constants/Color_constant.dart';
import 'package:e_bike/Screens/ProfileView.dart';
import 'package:e_bike/Screens/drawerScreens/Wallet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstant.blueGray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 40.w, top: 10.h),
              child: Text(
                'Account',
                style: GoogleFonts.inter(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 30.w, bottom: 10.h),
              child: ListTile(
                title: Text(
                  'Profile',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 24.sp,
                      color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorConstant.gray00,
                ),
                onTap: () => Get.to(() => ProfileView()),
              ),
            ),
            Divider(
              color: ColorConstant.graydiv,
              height: 0.h,
              thickness: 1.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 30.w, bottom: 20.h, top: 25.h),
              child: ListTile(
                title: Text(
                  'Wallet',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 24.sp,
                      color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorConstant.gray00,
                ),
                onTap: () => Get.to(() => Wallet()),
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
    ));
  }
}
