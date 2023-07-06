import 'package:e_bike/CustomWidget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Services/weather_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Models/Weather_model.dart';
import '../utils/Color_constant.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();
  bool isOn = false;
  String location = 'Cairo'; //Default location
  WeatherModel weatherModel = WeatherModel(
    location: '',
    weatherIcon: '',
    statusIcon: '',
    temperature: 0,
    windSpeed: 0,
    humidity: 0,
    cloud: 0,
    currentDate: '',
    sunset: '',
    sunrise: '',
    currentWeatherStatus: '',
  );

  void fetchWeatherData(String searchText) async {
    var weatherData = await WeatherApi.fetchWeatherData(searchText);
    setState(() {
      weatherModel = WeatherModel.fromJson(weatherData);
    });
  }

  @override
  void initState() {
    fetchWeatherData(location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      child: Center(
                          child: Text(
                        weatherModel.currentDate,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400, fontSize: 18.sp),
                      )),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 35.w, top: 40.h),
                      child: Image.asset("images/cloudly.png"),
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 180.w, top: 65.h),
                            child: Text(
                              '${weatherModel.temperature}',
                              style: GoogleFonts.montserrat(
                                  fontSize: 32.sp, fontWeight: FontWeight.w400),
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 75.h),
                          child: Text(
                            weatherModel.currentWeatherStatus,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400, fontSize: 18.sp),
                          ),
                        ),
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
                              Container(
                                child: Text(
                                  '${weatherModel.windSpeed} km/h',
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
                              Container(
                                child: Text(
                                  '${weatherModel.humidity}%',
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
                                Container(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: Text(
                                    '${weatherModel.cloud}%',
                                    style: GoogleFonts.inter(
                                        fontSize: 19.23.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
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
                                Container(
                                  child: Text(
                                    weatherModel.sunrise,
                                    style: GoogleFonts.inter(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 55.w, top: 70.h),
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
                                Container(
                                  child: Text(
                                    '${weatherModel.temperature}°C',
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
                                  Container(
                                    padding: EdgeInsets.only(left: 5.w),
                                    child: Text(
                                      weatherModel.sunset,
                                      style: GoogleFonts.inter(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
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
