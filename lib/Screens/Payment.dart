import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/Color_constant.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
                  icon: Icon(Icons.arrow_back)),
            ),
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(left: 40, top: 5),
                child: Text(
                  'Payment',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: Colors.white
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Image.asset('images/card.png')),
                  Container(
                      padding: EdgeInsets.only(left: 265, top: 50),
                      child: Image.asset('images/logo1.png')),
                  Container(
                      padding: EdgeInsets.only(left: 270, top: 105),
                      child: Image.asset(
                        'images/master.png',
                        color: Colors.black,
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 45, top: 165),
                    child: Text(
                      'Balance',
                      style: GoogleFonts.montserrat(
                        fontSize: 21,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 45, top: 190),
                    child: Text(
                      '\$ 10.50',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,fontSize: 32
                      ),
                    ),
                  ),
                ],
              ),
                  
                  Container(
                    padding: EdgeInsets.only(left: 25,bottom: 10),
                    child: ListTile(
                      title: Text(
                        'MasterCard',
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      ),
                      trailing: Container(padding:EdgeInsets.only(bottom: 10) ,child: Image.asset('images/cardd.png')),
                      onTap: () {}
                    ),
                  ),
                  Divider(
                    color: ColorConstant.graydiv,
                    height: 1,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25,bottom: 10, top: 10),
                    child: ListTile(
                        title: Text(
                          'Payment Options',
                          style: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorConstant.gray00,
                        ),
                        onTap: () {}
                    ),
                  ),
                  Divider(
                    color: ColorConstant.graydiv,
                    height: 2,
                  ),
            ])
        ));
  }
}
