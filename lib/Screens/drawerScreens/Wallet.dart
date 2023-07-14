import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:e_bike/Controller/Wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Constants/Color_constant.dart';

class Wallet extends GetView<WalletController> {
  Wallet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(WalletController());
    return SafeArea(
        child: Obx(
      () => BlurryModalProgressHUD(
          inAsyncCall: controller.isLoading.value,
          blurEffectIntensity: 3,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
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
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40.w, top: 5.h),
                    child: Text(
                      'Wallet',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          fontSize: 24.sp,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 64.h,
                  ),
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20.w),
                            width: 350.sp,
                            height: 224.sp,
                            decoration: BoxDecoration(
                                color: ColorConstant.brownny,
                                borderRadius: BorderRadius.circular(24.sp)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 50.sp),
                                width: 350.w,
                                height: 224.h,
                                child: Image.asset(
                                  'images/yarab.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                right: 44.w,
                                top: 24.h,
                              ),
                              child: Text(
                                'Weekly Points',
                                style: GoogleFonts.montserrat(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              right: 44.w,
                              top: 59.h,
                            ),
                            child: GetBuilder<WalletController>(
                                builder: (controller) => Text(
                                      '${controller.points}',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.sp,
                                          color: Colors.white),
                                    )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 44.w, top: 160.h),
                            width: 131.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  ColorConstant.whiteA700.withOpacity(0.5),
                                  ColorConstant.whiteB700.withOpacity(0.5)
                                ]),
                                borderRadius: BorderRadius.circular(20.sp),
                                color: Colors.white),
                            child: GetBuilder<WalletController>(
                                builder: (contnroller) => TextButton(
                                    onPressed: () {
                                      controller.transfer();
                                      print("done");
                                    },
                                    child: Text(
                                      'Transfer',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ))),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 27.w, top: 79.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Points :',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24.sp,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 120.w,
                            ),
                            GetBuilder<WalletController>(
                                builder: (controller) => Text(
                                      "${controller.points}",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 32.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ))
                          ],
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: ColorConstant.graydiv,
                    height: 0.h,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 27.w, top: 48.h),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            'Balance :',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 24.sp,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 100.w,
                          ),
                          Container(
                              margin: EdgeInsets.only(bottom: 1.h, right: 64.w),
                              child: GetBuilder<WalletController>(
                                  builder: (controller) => Text(
                                        '\$ ${controller.balance.toString()}',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 32.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Divider(
                    color: ColorConstant.graydiv,
                    height: 0,
                    thickness: 1,
                  ),
                ],
              ),
            ),
          )),
    ));
  }
}
