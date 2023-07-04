import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  icon: const Icon(Icons.arrow_back)),
            ),
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(left: 40.w, top: 5.h),
                child: Text(
                  'Payment',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800,
                      fontSize: 24.sp,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Stack(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Image.asset('images/card.png')),
                  Container(
                      padding: EdgeInsets.only(left: 265.w, top: 50.h),
                      child: Image.asset('images/logo1.png')),
                  Container(
                      padding: EdgeInsets.only(left: 270.w, top: 105.h),
                      child: Image.asset(
                        'images/master.png',
                        color: Colors.black,
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 45.w, top: 165.h),
                    child: Text(
                      'Balance',
                      style: GoogleFonts.montserrat(
                          fontSize: 21.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 45.w, top: 190.h),
                    child: Text(
                      '\$ 10.50',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 32.sp),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25.w, bottom: 10.h),
                child: ListTile(
                    title: Text(
                      'MasterCard',
                      style: GoogleFonts.montserrat(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    trailing: Container(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Image.asset('images/cardd.png')),
                    onTap: () {}),
              ),
              Divider(
                color: ColorConstant.graydiv,
                height: 1.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 25.w, bottom: 10.h, top: 10.h),
                child: ListTile(
                    title: Text(
                      'Payment Options',
                      style: GoogleFonts.montserrat(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstant.gray00,
                    ),
                    onTap: () {}),
              ),
              Divider(
                color: ColorConstant.graydiv,
                height: 2.h,
              ),
            ])));
  }
}
