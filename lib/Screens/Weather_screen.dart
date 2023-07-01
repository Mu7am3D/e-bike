import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Services/weather_api.dart';
import '../Models/Weather_model.dart';
import '../utils/Color_constant.dart';
import 'Account.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  GlobalKey<ScaffoldState> drawerkey = new GlobalKey<ScaffoldState>();
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
                    size: 30,
                  )),
              title: Center(
                  child: Text(
                "E-Bike",
                style: GoogleFonts.inter(
                    fontSize: 20,
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
              width: 290,
              backgroundColor: ColorConstant.blueGray900,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40, top: 50),
                    child: Text(
                      'Settings',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: ListTile(
                      title: Text(
                        'Account',
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorConstant.gray00,
                      ),
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Account())),
                    ),
                  ),
                  Divider(
                    color: ColorConstant.graydiv,
                    height: 1,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
                    child: ListTile(
                      title: Text(
                        'Ride History',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
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
                    height: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, bottom: 15),
                    child: ListTile(
                      title: Text(
                        'Language',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      trailing: Text(
                        'English',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Divider(
                    color: ColorConstant.graydiv,
                    height: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, bottom: 15),
                    child: ListTile(
                      title: Text(
                        'Notification',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      trailing: Switch(
                          value: isOn,
                          onChanged: (_isOn) {
                            setState(() {
                              isOn = _isOn;
                            });
                          }),
                      onTap: () {
                        setState(() {
                          isOn = !isOn;
                        });
                      },
                    ),
                  ),
                  Divider(
                    color: ColorConstant.graydiv,
                    height: 2,
                  ),
                ],
              ),
            ),
            body: Column(children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12, top: 15),
                    height: 190,
                    width: 366,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 160, left: 12),
                    height: 53,
                    width: 366,
                    child: Center(
                        child: Text(
                      weatherModel.currentDate,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400, fontSize: 18),
                    )),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(26)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35, top: 40),
                    child: Image.asset("images/cloudly.png"),
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 180, top: 65),
                          child: Text(
                            '${weatherModel.temperature}',
                            style: GoogleFonts.montserrat(
                                fontSize: 32, fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 75),
                        child: Text(
                          weatherModel.currentWeatherStatus,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 180, top: 110),
                    child: Text(
                      'Cairo',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Center(
                                child: Text(
                                  'TODAY',
                                  style: GoogleFonts.inter(
                                      fontSize: 23.41,
                                      fontWeight: FontWeight.w700),
                                ),
                              )),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: ColorConstant.weth),
                      height: 280,
                      width: 366,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 50, top: 70),
                        child: Column(
                          children: [
                            Image.asset('images/Wind.png'),
                            Container(
                              child: Text(
                                'HAZE',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.55),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${weatherModel.windSpeed} km/h',
                                style: GoogleFonts.inter(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 50, top: 70),
                        child: Column(
                          children: [
                            Image.asset('images/Drop.png'),
                            Container(
                              child: Text(
                                'DROP',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.55),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${weatherModel.humidity}%',
                                style: GoogleFonts.inter(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 50, top: 70),
                          child: Column(
                            children: [
                              Image.asset('images/CloudRain.png'),
                              Container(
                                child: Text(
                                  'CLOUD',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.55),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  '${weatherModel.cloud}%',
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 40, top: 70),
                          child: Column(
                            children: [
                              Image.asset('images/Sun.png'),
                              Container(
                                child: Text(
                                  'SUN RISE',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.55),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${weatherModel.sunrise}',
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 50, top: 70),
                          child: Column(
                            children: [
                              Image.asset('images/tempe.png'),
                              Container(
                                child: Text(
                                  'TEMP',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.55),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${weatherModel.temperature}°C',
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 50, top: 70),
                            child: Column(
                              children: [
                                Image.asset('images/Sun.png'),
                                Container(
                                  child: Text(
                                    'SUNSET',
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.55),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    '${weatherModel.sunset}',
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
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
            ])));
  }
}
