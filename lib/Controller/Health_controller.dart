import 'package:e_bike/Constants/Color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthController extends GetxController {
  final DatabaseReference _dbref = FirebaseDatabase.instance.ref();
  var newTemp = RxInt(0);
  var heartRate = RxInt(0);
  var bloodOx = RxInt(0);
  RxBool isLoading = false.obs;
  var bloodPressure = ''.obs;
  bool isOn = false;

  @override
  void onInit() {
    super.onInit();
    tamperatureChange();
    heartBeat();
    oXPerc();
    bP();
    checkTemperature();
    checkHeartRate();
    startLoading();
  }

  void checkTemperature() {
    ever(newTemp, (value) {
      if (value != null && (value as int) > 38) {
        showTemperatureBottomSheet();
      }
    });
  }

  void startLoading() {
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }

  void checkHeartRate() {
    ever(heartRate, (value) {
      if (value != null && (value as int < 60 || value > 100)) {
        showHeartRateBottomSheet();
      }
    });
  }

  void showHeartRateBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 221.h,
        child: Stack(
          children: [
            Center(
                child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
              width: 355.w,
              height: 70.h,
              child: Row(children: [
                Container(
                    padding: EdgeInsets.only(left: 25.h),
                    child: Icon(Icons.warning_amber_rounded)),
                SizedBox(
                  width: 20.w,
                ),
              ]),
            )),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 88.h, right: 120.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("High Heart Rate"),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      child: Text(
                        "Need To Stop Riding",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 27.w, top: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Warning",
                    style: TextStyle(fontSize: 20.sp),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: ColorConstant.warning,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  void showTemperatureBottomSheet() {
    if (!Get.isBottomSheetOpen!) {
      Get.bottomSheet(
        Container(
          height: 221.h,
          child: Stack(
            children: [
              Center(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 355.w,
                height: 70.h,
                child: Row(children: [
                  Container(
                      padding: EdgeInsets.only(left: 25.h),
                      child: Icon(Icons.warning_amber_rounded)),
                  SizedBox(
                    width: 20.w,
                  ),
                ]),
              )),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 88.h, right: 120.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Text("High Body Temperature"),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        child: Text(
                          "Need To Stop Riding",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 27.w, top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Warning",
                      style: TextStyle(fontSize: 20.sp),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        backgroundColor: ColorConstant.warning,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      );
      ;
    }
    ;
  }

  void tamperatureChange() {
    _dbref
        .child('Body')
        .child('Temperature')
        .onValue
        .listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print('Tempearature: $data');
      newTemp.value = int.parse(data.toString());
    });
  }

  void heartBeat() {
    _dbref
        .child('Body')
        .child('Heart Beat')
        .onValue
        .listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print('Heart Beat: $data');
      heartRate.value = int.parse(data.toString());
    });
  }

  void oXPerc() {
    _dbref
        .child('Body')
        .child('Blood Ox')
        .onValue
        .listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print('Blood Ox: $data');
      bloodOx.value = int.parse(data.toString());
    });
  }

  void bP() {
    _dbref.child('Body').child('Blood Pressure').onValue.listen((event) {
      final data = event.snapshot.value;
      print('Blood Pressure: $data');
      bloodPressure.value = data.toString();
    });
  }

  void toggle() {
    isOn = !isOn;
    update();
  }
}
