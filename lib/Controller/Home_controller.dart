import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_bike/Constants/Color_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final DatabaseReference _dbref = FirebaseDatabase.instance.ref();
  var newTemp = RxInt(0);
  var smoke = RxInt(0);
  var status = RxString('');

  var isOn = false;
  RxBool isLoading = false.obs;
  final String userId;

  HomeController(this.userId);
  var switchControl = false;
  var totalDistance = RxDouble(0);
  var SaveDistance = RxDouble(0);

  @override
  void onInit() {
    super.onInit();
    tamperatureChange();
    smokeChange();
    checkBatteryTemp();
    loadDistance();
    startLoading();
    checkSmoke();
  }

  void switchC() {
    switchControl = !switchControl;
    update();
  }

  void startLoading() {
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }

  void updateValue() {
    _dbref.child("Flash").update({"Status": !isOn});
    update();
  }

  void tamperatureChange() {
    _dbref.child('Battery').child('Temperature').onValue.listen((event) {
      final data = event.snapshot.value;
      print('Temperature: $data');
      newTemp.value = int.parse(data.toString());
      update();
    });
  }

  void smokeChange() {
    _dbref.child('Smoke').child('Value').onValue.listen((event) {
      final data = event.snapshot.value;
      print('Value: $data');
      smoke.value = int.parse(data.toString());
      update();
    });
  }

  void checkSmoke() {
    ever(smoke, (value) {
      if (value != null && (value as int > 200)) {
        showSmokeBottomSheet();
      }
    });
  }

  void showSmokeBottomSheet() {
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
                      child: Text("Smoke Detected"),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      child: Text(
                        "Need To check the bike",
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

  void loadDistance() {
    firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .snapshots() // Listen for real-time changes
        .listen((snapshot) {
      final int distance = snapshot.data()!['Distance'];
      totalDistance.value = distance.toDouble();
      update(); // Notify GetBuilder that the data has changed
    });
  }

  void checkBatteryTemp() {
    ever(newTemp, (value) {
      if (value != null && (value as int > 70)) {
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
                      child: Text("High Battery Temp"),
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
}
