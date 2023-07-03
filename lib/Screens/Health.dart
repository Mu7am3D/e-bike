import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/AuthController.dart';
import '../utils/Color_constant.dart';
import 'Account.dart';

class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  late DatabaseReference _dbref;
  var newTemp;
  String databasejson = '';
  AuthController authController = AuthController();
  GlobalKey<ScaffoldState> drawerkey = new GlobalKey<ScaffoldState>();
  bool isOn = false;
  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
    tamperatureChange();
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
            body: Column(children: [
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
                          'Heart Rate',
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
                                '98',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600, fontSize: 32),
                              ),
                              padding: EdgeInsets.only(
                                left: 110,
                              )),
                          SizedBox(
                            width: 35,
                          ),
                          Text('bpm',
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
                            const EdgeInsets.only(left: 35, right: 10, top: 35),
                        child: SvgPicture.asset('images/heart.svg'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
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
                          'Blood Pressure',
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
                                '102/72',
                                style: GoogleFonts.montserrat(
                                    fontSize: 32, fontWeight: FontWeight.w600),
                              ),
                              padding: EdgeInsets.only(
                                left: 110,
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          Text('mmhg',
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
                            const EdgeInsets.only(left: 40, right: 10, top: 35),
                        child: SvgPicture.asset('images/bp.svg'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
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
                          'Body Temperature',
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
                                '$newTemp',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600, fontSize: 32),
                              ),
                              padding: EdgeInsets.only(
                                left: 110,
                              )),
                          SizedBox(
                            width: 35,
                          ),
                          Text('°C',
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
                            const EdgeInsets.only(left: 40, right: 10, top: 20),
                        child: SvgPicture.asset('images/temp.svg'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
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
                          'Percent Oxygen in Blood',
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
                                '96',
                                style: GoogleFonts.montserrat(
                                    fontSize: 32, fontWeight: FontWeight.w600),
                              ),
                              padding: EdgeInsets.only(
                                left: 110,
                              )),
                          SizedBox(
                            width: 35,
                          ),
                          Text('%',
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
                            const EdgeInsets.only(left: 40, right: 10, top: 35),
                        child: Stack(
                          children: [
                            SvgPicture.asset('images/drop.svg'),
                            Container(
                                margin: const EdgeInsets.only(top: 17, left: 2),
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

  void tamperatureChange() {
    _dbref
        .child('Body')
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

  /*
  readdb_onechild() {
    _dbref
        .child("Test")
        .child("Temperature")
        .once()
        .then((DatabaseEvent databaseEvent) {
      print(" read once - " + databaseEvent.snapshot.value.toString());
      setState(() {
        databasejson = databaseEvent.snapshot.value.toString();
      });
      print("data = " + databasejson);
    });
  }
*/
}
