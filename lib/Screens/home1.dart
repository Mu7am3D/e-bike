import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/AuthController.dart';
import '../utils/Color_constant.dart';
import 'Account.dart';
import '../Controller/Home_controller.dart';

class HomeView extends GetView<HomeController> {
  AuthController authController = AuthController();
  GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
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
        drawer: Drawer(
          width: 290.w,
          backgroundColor: ColorConstant.blueGray900,
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
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Account())),
                ),
              ),
              Divider(
                color: ColorConstant.graydiv,
                height: 1.h,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15),
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
                height: 1.h,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, bottom: 15),
                child: ListTile(
                  title: Text(
                    'Language',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp,
                        color: Colors.white),
                  ),
                  trailing: Text(
                    'English',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp,
                        color: Colors.white),
                  ),
                  onTap: () {},
                ),
              ),
              Divider(
                color: ColorConstant.graydiv,
                height: 0.5,
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
                height: 2.h,
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
                height: 1.5.h,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
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
                          'Distance',
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
                                left: 90.w,
                              ),
                              child: Text(
                                '3752',
                                style: GoogleFonts.montserrat(
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('m',
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
                            EdgeInsets.only(left: 40.w, right: 10.w, top: 35.h),
                        child: SvgPicture.asset('images/dis.svg'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
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
                          'Temperature of Battery',
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
                                left: 100.w,
                              ),
                              child: Obx(() => Text(
                                    '${controller.newTemp}',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.w600),
                                  ))),
                          SizedBox(
                            width: 40.w,
                          ),
                          Text('°C',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600, fontSize: 18.sp))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.w, top: 20.h),
                            child: Image.asset('images/tempp.png'),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50.w, top: 17.h),
                            child: Image.asset('images/fullb.png'),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
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
                          'Smoke Around Bike',
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
                                left: 100.w,
                              ),
                              child: Obx(() => Text(
                                    '${controller.smoke}',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.w600),
                                  ))),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                              "${controller.smoke != null && controller.smoke > 200 ? 'smoke detected' : 'No smoke'}",
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
                            EdgeInsets.only(left: 30.w, right: 20.w, top: 18.h),
                        child: Image.asset('images/smoke.png'),
                      ),
                    ],
                  )
                ],
              ),
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
                        padding: const EdgeInsets.only(left: 92, top: 15),
                        child: Text(
                          'Fire Around Bike',
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
                                left: 100.w,
                              ),
                              child: Obx(() => Text(
                                    '${controller.status}',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 32.sp),
                                  ))),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 35.w, right: 10.w, top: 30.h),
                        child: Image.asset('images/fire.png'),
                      ),
                    ],
                  )
                ],
              ),
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
                        left: 10.sp,
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
                          'Flash Light Front & Back',
                          style: GoogleFonts.montserrat(
                              fontSize: 18.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          GetBuilder<HomeController>(
                            builder: (controller) => Container(
                                padding: EdgeInsets.only(
                                  left: 140.w,
                                ),
                                child: Switch(
                                    value: controller.isOn,
                                    onChanged: (isOn) {
                                      controller.updateValue();
                                      controller.isOn = !controller.isOn;
                                    })),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 35.w, right: 10.w, top: 30.h),
                        child: Image.asset('images/Light.png'),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
