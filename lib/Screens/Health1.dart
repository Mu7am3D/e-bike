import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/AuthController.dart';
import '../utils/Color_constant.dart';
import 'package:e_bike/CustomWidget/drawer.dart';
import 'package:get/get.dart';
import '../Controller/Health_controller.dart';

class healthView extends GetView<HealthController> {
  healthView({Key? key}) : super(key: key);
  AuthController authController = AuthController();
  GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(HealthController());
    return SafeArea(
        child: Scaffold(
            key: drawerkey,
            backgroundColor: ColorConstant.blueGray900,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    drawerkey.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30.sp,
                  )),
              title: Center(
                  child: Text(
                "E-Bike",
                style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic),
              )),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('images/img_globe.svg'))
              ],
            ),
            drawer: AppDrawer(width:290.w),
            body: Column(children: [
              SizedBox(
                height: 10.h,
              ),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.sp)),
                      margin: EdgeInsets.only(
                        left: 10.w,
                      ),
                      height: 94.h,
                      width: 366.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 92.w, top: 15.h),
                        child: Text(
                          'Heart Rate',
                          style: GoogleFonts.montserrat(
                              fontSize: 18.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                left: 110.w,
                              ),
                              child: Text(
                                '98',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 32.sp),
                              )),
                          SizedBox(
                            width: 35.w,
                          ),
                          Text('bpm',
                              style: GoogleFonts.montserrat(
                                  fontSize: 18.sp, fontWeight: FontWeight.w600))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 35.w, right: 10.w, top: 35.h),
                        child: SvgPicture.asset('images/heart.svg'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.sp)),
                      margin: EdgeInsets.only(
                        left: 10.w,
                      ),
                      height: 94.h,
                      width: 366.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 92.w, top: 15.h),
                        child: Text(
                          'Blood Pressure',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400, fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                left: 110.w,
                              ),
                              child: Text(
                                '102/72',
                                style: GoogleFonts.montserrat(
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          Text('mmhg',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600, fontSize: 18.sp))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 40.w, right: 10.w, top: 35.h),
                        child: SvgPicture.asset('images/bp.svg'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25.w,
              ),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.sp)),
                      margin: EdgeInsets.only(
                        left: 10.w,
                      ),
                      height: 94.h,
                      width: 366.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 92.w, top: 15.h),
                        child: Text(
                          'Body Temperature',
                          style: GoogleFonts.montserrat(
                              fontSize: 18.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Obx(() => Container(
                              padding: EdgeInsets.only(
                                left: 110.w,
                              ),
                              child: Text(
                                '${controller.newTemp}',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 32.sp),
                              ))),
                          SizedBox(
                            width: 35.w,
                          ),
                          Text('°C',
                              style: GoogleFonts.montserrat(
                                  fontSize: 18.sp, fontWeight: FontWeight.w600))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 40.w, right: 10.w, top: 20.h),
                        child: SvgPicture.asset('images/temp.svg'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.sp)),
                      margin: EdgeInsets.only(
                        left: 10.w,
                      ),
                      height: 94.h,
                      width: 366.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 92.w, top: 15.h),
                        child: Text(
                          'Percent Oxygen in Blood',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400, fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                left: 110.w,
                              ),
                              child: Text(
                                '96',
                                style: GoogleFonts.montserrat(
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                          SizedBox(
                            width: 35.w,
                          ),
                          Text('%',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600, fontSize: 18.sp))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 40.w, right: 10.w, top: 35.h),
                        child: Stack(
                          children: [
                            SvgPicture.asset('images/drop.svg'),
                            Container(
                                margin: EdgeInsets.only(top: 17.h, left: 2.w),
                                child: Image.asset('images/O2.png'))
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ])));
  }
}
