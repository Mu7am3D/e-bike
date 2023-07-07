import 'package:e_bike/CustomWidget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/Color_constant.dart';
import '../Controller/Weather_controller.dart';

class WeatherView extends GetView<WeatherController> {
  WeatherView({super.key});
  final GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();

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
            drawer: AppDrawer(
              width: 290.w,
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
                                controller.weatherModel.currentDate,
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
                  height: 36.h,
                ),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.sp),
                            color: ColorConstant.weth),
                        height: 301.h,
                        width: 366.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.only(top: 27.37.h),
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
                    Container(
                      margin: EdgeInsets.only(right: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5.w, top: 82.95.h),
                            child: Column(
                              children: [
                                Image.asset('images/Wind.png'),
                                Text(
                                  'HAZE',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.55.sp),
                                ),
                                GetBuilder<WeatherController>(
                                  builder: (controller) => Text(
                                    '${controller.weatherModel.windSpeed} km/h',
                                    style: GoogleFonts.inter(
                                        fontSize: 19.23.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 62.w, top: 82.95.h),
                            child: Column(
                              children: [
                                Image.asset('images/Drop.png'),
                                Text(
                                  'DROP',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.55.sp),
                                ),
                                GetBuilder<WeatherController>(
                                  builder: (controller) => Text(
                                    '${controller.weatherModel.humidity}%',
                                    style: GoogleFonts.inter(
                                        fontSize: 19.23.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(left: 62.w, top: 82.95.h),
                              child: Column(
                                children: [
                                  Image.asset('images/CloudRain.png'),
                                  Text(
                                    'CLOUD',
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.55.sp),
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
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 105.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 82.95.h),
                            child: Column(
                              children: [
                                Image.asset('images/Sun.png'),
                                Text(
                                  'SUNRISE',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.55.sp),
                                ),
                                GetBuilder<WeatherController>(
                                  builder: (controller) => Text(
                                    controller.weatherModel.sunrise,
                                    style: GoogleFonts.inter(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 70.w, top: 82.95.h),
                            child: Column(
                              children: [
                                Image.asset('images/tempe.png'),
                                Text(
                                  'TEMP',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.55.sp),
                                ),
                                GetBuilder<WeatherController>(
                                  builder: (controller) => Text(
                                    '${controller.weatherModel.temperature}°C',
                                    style: GoogleFonts.inter(
                                        fontSize: 19.23.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(left: 52.w, top: 82.95.h),
                              child: Column(
                                children: [
                                  Image.asset('images/Sun.png'),
                                  Text(
                                    'SUNSET',
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.55.sp),
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
