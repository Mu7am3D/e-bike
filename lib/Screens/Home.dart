import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/AuthController.dart';
import '../utils/Color_constant.dart';
import 'Account.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseReference _dbref;
  var newTemp;
  var _Smoke;
  var _Status;
  AuthController authController = AuthController();
  GlobalKey<ScaffoldState> drawerkey = new GlobalKey<ScaffoldState>();
  bool isOn = false;
  bool switchControl = false;
  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
    tamperatureChange();
    SmokeChange();
    FlameSens();
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
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Account())),
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
                height: 0.5,
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
                      value: switchControl,
                      onChanged: (value) {
                        setState(() {
                          switchControl = value;
                          print(switchControl);
                        });
                      }),
                ),
              ),
              Divider(
                color: ColorConstant.graydiv,
                height: 2,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
                child: ListTile(
                  title: Text(
                    'Logout',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
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
                height: 1.5,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      height: 94,
                      width: 366),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 92, top: 15),
                        child: Text(
                          'Distance',
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              child: Text(
                                '3752',
                                style: GoogleFonts.montserrat(
                                    fontSize: 32, fontWeight: FontWeight.w600),
                              ),
                              padding: EdgeInsets.only(
                                left: 90,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text('m',
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w600))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 40, right: 10, top: 35),
                        child: SvgPicture.asset('images/dis.svg'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      height: 94,
                      width: 366),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 92, top: 15),
                        child: Text(
                          'Temperature of Battery',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              child: Text(
                                '$newTemp',
                                style: GoogleFonts.montserrat(
                                    fontSize: 32, fontWeight: FontWeight.w600),
                              ),
                              padding: EdgeInsets.only(
                                left: 100,
                              )),
                          SizedBox(
                            width: 40,
                          ),
                          Text('°C',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600, fontSize: 18))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 0, top: 20),
                            child: Image.asset('images/tempp.png'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 50, right: 0, top: 17),
                            child: Image.asset('images/fullb.png'),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      height: 94,
                      width: 366),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 92, top: 15),
                        child: Text(
                          'Smoke Around Bike',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              child: Text(
                                '$_Smoke',
                                style: GoogleFonts.montserrat(
                                    fontSize: 32, fontWeight: FontWeight.w600),
                              ),
                              padding: EdgeInsets.only(
                                left: 100,
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                              _Smoke != null && _Smoke > 200
                                  ? 'smoke detected'
                                  : 'No smoke',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600, fontSize: 18))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 30, right: 20, top: 18),
                        child: Image.asset('images/smoke.png'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      height: 94,
                      width: 366),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 92, top: 15),
                        child: Text(
                          'Fire Around Bike',
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              child: Text(
                                '$_Status',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600, fontSize: 32),
                              ),
                              padding: EdgeInsets.only(
                                left: 100,
                              )),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 35, right: 10, top: 30),
                        child: Image.asset('images/fire.png'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      height: 94,
                      width: 366),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 92, top: 15),
                        child: Text(
                          'Flash Light Front & Back',
                          style: GoogleFonts.montserrat(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              child: Switch(
                                  value: isOn,
                                  onChanged: (_isOn) {
                                    _updatevalue();
                                    setState(() {
                                      isOn = _isOn;
                                    });
                                  }),
                              padding: EdgeInsets.only(
                                left: 140,
                              )),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 35, right: 10, top: 30),
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

  _updatevalue() {
    _dbref.child("Flash").update({"Status": !isOn});
  }

  void tamperatureChange() {
    _dbref
        .child('Battery')
        .child('Temperature')
        .onValue
        .listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print('Tempearature: $data');
      setState(() {
        newTemp = data;
      });
    });
  }

  void SmokeChange() {
    _dbref.child('Smoke').child('Value').onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print('Value: $data');
      setState(() {
        _Smoke = data;
      });
    });
  }

  void FlameSens() {
    _dbref
        .child('Flame sensor')
        .child('Status')
        .onValue
        .listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print('Status: $data');
      setState(() {
        _Status = data;
      });
    });
  }
}
