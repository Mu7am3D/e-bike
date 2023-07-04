import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/Color_constant.dart';
import 'Account.dart';
import '../Controller/Weather_controller.dart';

class WeatherView extends GetView<WeatherController> {
  WeatherView({super.key});
  GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(WeatherController());
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
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Account())),
                    ),
                  ),
                  Divider(
                    color: ColorConstant.graydiv,
                    height: 1.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 10.w, top: 15.h, bottom: 15.h),
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
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.w, bottom: 15.h),
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
                    height: 1.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.w, bottom: 15.h),
                    child: GetBuilder<WeatherController>(
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
                          value: controller.isOn,
                          onChanged: (value) {
                            controller.toggle();
                          },
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: ColorConstant.graydiv,
                    height: 2.h,
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 12.w, top: 15.h),
                      height: 190.h,
                      width: 366.w,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(24.sp)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 160.h, left: 12.w),
                      height: 53.h,
                      width: 366.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(26.sp)),
                      child: GetBuilder<WeatherController>(
                          builder: (controller) => Center(
                                  child: Text(
                                "${controller.weatherModel.currentDate}",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp),
                              ))),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 35.w, top: 40.h),
                      child: Image.asset("images/cloudly.png"),
                    ),
                    Row(
                      children: [
                        GetBuilder<WeatherController>(
                            builder: (controller) => Container(
                                margin: EdgeInsets.only(left: 180.w, top: 65.h),
                                child: Text(
                                  '${controller.weatherModel.temperature}',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.w400),
                                ))),
                        SizedBox(
                          width: 10.w,
                        ),
                        GetBuilder<WeatherController>(
                            builder: (controller) => Container(
                                  margin: EdgeInsets.only(top: 75.h),
                                  child: Text(
                                    controller
                                        .weatherModel.currentWeatherStatus,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.sp),
                                  ),
                                )),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 180.w, top: 110.h),
                      child: Text(
                        'Cairo',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400, fontSize: 18.sp),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.sp),
                            color: ColorConstant.weth),
                        height: 280.h,
                        width: 366.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.only(top: 20.h),
                                child: Center(
                                  child: Text(
                                    'TODAY',
                                    style: GoogleFonts.inter(
                                        fontSize: 23.41.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 50.w, top: 70.h),
                          child: Column(
                            children: [
                              Image.asset('images/Wind.png'),
                              Container(
                                child: Text(
                                  'HAZE',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.55.sp),
                                ),
                              ),
                              GetBuilder<WeatherController>(
                                  builder: (controller) => Container(
                                        child: Text(
                                          '${controller.weatherModel.windSpeed} km/h',
                                          style: GoogleFonts.inter(
                                              fontSize: 19.23.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 50.w, top: 70.h),
                          child: Column(
                            children: [
                              Image.asset('images/Drop.png'),
                              Container(
                                child: Text(
                                  'DROP',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.55.sp),
                                ),
                              ),
                              GetBuilder<WeatherController>(
                                  builder: (controller) => Container(
                                        child: Text(
                                          '${controller.weatherModel.humidity}%',
                                          style: GoogleFonts.inter(
                                              fontSize: 19.23.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 50.w, top: 70.h),
                            child: Column(
                              children: [
                                Image.asset('images/CloudRain.png'),
                                Container(
                                  child: Text(
                                    'CLOUD',
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.55.sp),
                                  ),
                                ),
                                GetBuilder<WeatherController>(
                                    builder: (controller) => Container(
                                          padding: EdgeInsets.only(left: 5.w),
                                          child: Text(
                                            '${controller.weatherModel.cloud}%',
                                            style: GoogleFonts.inter(
                                                fontSize: 19.23.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ))
                              ],
                            ))
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 100.h),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 49.w, top: 70.h),
                            child: Column(
                              children: [
                                Image.asset('images/Sun.png'),
                                Container(
                                  child: Text(
                                    'SUN RISE',
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.55.sp),
                                  ),
                                ),
                                GetBuilder<WeatherController>(
                                    builder: (controller) => Container(
                                          child: Text(
                                            controller.weatherModel.sunrise,
                                            style: GoogleFonts.inter(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 60.w, top: 70.h),
                            child: Column(
                              children: [
                                Image.asset('images/tempe.png'),
                                Container(
                                  child: Text(
                                    'TEMP',
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.55.sp),
                                  ),
                                ),
                                GetBuilder<WeatherController>(
                                    builder: (controller) => Container(
                                          child: Text(
                                            '${controller.weatherModel.temperature}°C',
                                            style: GoogleFonts.inter(
                                                fontSize: 19.23.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 50.w, top: 70.h),
                              child: Column(
                                children: [
                                  Image.asset('images/Sun.png'),
                                  Container(
                                    child: Text(
                                      'SUNSET',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17.55.sp),
                                    ),
                                  ),
                                  GetBuilder<WeatherController>(
                                      builder: (controller) => Container(
                                            padding: EdgeInsets.only(left: 5.w),
                                            child: Text(
                                              controller.weatherModel.sunset,
                                              style: GoogleFonts.inter(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ))
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            )));
  }
}
