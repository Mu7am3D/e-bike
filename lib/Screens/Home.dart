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
  AuthController authController = AuthController();
  GlobalKey<ScaffoldState> drawerkey = new GlobalKey<ScaffoldState>();
  bool isOn = false;
  int _pedal = 5;
  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();

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
          title: Center(child: Text("E-Bike",style: GoogleFonts.inter(
            fontSize: 20,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic
          ),)),
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
                      color:Colors.white
                  ),
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
                        color:Colors.white
                    ),
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
                      color: Colors.white
                    ),
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
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10,bottom: 15),
                child: ListTile(
                  title: Text(
                    'Language',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                  trailing: Text('English',style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white
                  ),),
                  onTap: () {},
                ),
              ),
              Divider(
                color: ColorConstant.graydiv,
                height: 0.5,
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10,bottom: 15),
                child: ListTile(
                  title: Text(
                    'Notification',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                  trailing: Switch(value: isOn, onChanged: (_isOn){
                    setState(() {
                      isOn = _isOn;
                    });
                  }),
                  onTap: () {
                    _updatevalue();
                    setState(() {
                      isOn =! isOn;
                    });
                    print(isOn);
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
                        color: Colors.white
                    ),
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
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                          ),
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
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              padding: EdgeInsets.only(
                                left: 90,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text('m', style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ))
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
                          'Charge',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              child: Text(
                                '87',
                                style: GoogleFonts.montserrat(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              padding: EdgeInsets.only(
                                left: 100,
                              )),
                          SizedBox(
                            width: 40,
                          ),
                          Text('%', style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                          ))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 40, right: 10, top: 35),
                        child: Image.asset('images/batt.png'),
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
                          'Speed',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              child: Text(
                                '30',
                                style: GoogleFonts.montserrat(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              padding: EdgeInsets.only(
                                left: 100,
                              )),
                          SizedBox(
                            width: 45,
                          ),
                          Text('km/h', style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                          ))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 35, right: 10, top: 35),
                        child: Image.asset('images/sp.png'),
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
                          'Pedal Assist',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              child: Text(
                                '$_pedal',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32
                                ),
                              ),
                              padding: EdgeInsets.only(
                                left: 100,
                              )),
                          SizedBox(
                            width: 130,
                          ),
                          IconButton(onPressed: (){setState(() {
                            _pedal++;
                          });}, icon: SvgPicture.asset('images/up.svg')),

                          SizedBox(
                            width: 20,
                          ),
                          IconButton(onPressed: (){setState(() {
                            _pedal--;
                          });}, icon: SvgPicture.asset('images/down.svg'))

                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 35, right: 10, top: 35),
                        child: Image.asset('images/bic.png'),
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
                          'Power',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              child: Text(
                                '550',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32
                                ),
                              ),
                              padding: EdgeInsets.only(
                                left: 100,
                              )),
                          SizedBox(
                            width: 30,
                          ),
                          Text('watt', style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 40, right: 10, top: 35),
                        child: SvgPicture.asset('images/power.svg'),
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
    _dbref.child("LED").update({"digital": !isOn});
  }
}
