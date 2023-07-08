import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/Color_constant.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 40.w, top: 5.h),
            child: Text(
              'Wallet',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 64.h,
          ),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20.w),
                    width: 350.sp,
                    height: 224.sp,
                    decoration: BoxDecoration(
                        color: ColorConstant.brownny,
                        borderRadius: BorderRadius.circular(24.sp)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        right: 44.w,
                        top: 24.h,
                      ),
                      child: Text(
                        'Weekly Points',
                        style: GoogleFonts.montserrat(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: 44.w,
                      top: 59.h,
                    ),
                    child: Text(
                      '200',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 44.w, top: 160.h),
                    width: 131.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          ColorConstant.whiteA700.withOpacity(0.5),
                          ColorConstant.whiteB700.withOpacity(0.5)
                        ]),
                        borderRadius: BorderRadius.circular(20.sp),
                        color: Colors.white),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Transfer',
                          style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 50.sp),
                        width: 350.w,
                        height: 224.h,
                        child: Image.asset(
                          'images/yarab.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 27.w, top: 79.h),
            child: ListTile(
                title: Text(
                  'Points :',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 24.sp,
                      color: Colors.white),
                ),
                trailing: Container(
                    padding: EdgeInsets.only(bottom: 5.h, right: 117.w),
                    child: Text(
                      '241',
                      style: GoogleFonts.montserrat(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                onTap: () {}),
          ),
          Divider(
            color: ColorConstant.graydiv,
            height: 1.25.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 27.w, bottom: 10.h, top: 10.h),
            child: ListTile(
                title: Text(
                  'Balance :',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 24.sp,
                      color: Colors.white),
                ),
                trailing: Container(
                    margin: EdgeInsets.only(bottom: 5.h, right: 64.w),
                    child: Text(
                      '\$ 10.50',
                      style: GoogleFonts.montserrat(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                onTap: () {}),
          ),
          Divider(
            color: ColorConstant.graydiv,
            height: 1.25.h,
          ),
        ],
      ),
    ));
  }
}
