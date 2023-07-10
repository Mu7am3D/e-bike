import 'package:e_bike/Constants/Color_constant.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeController extends GetxController {
  final DatabaseReference _dbref = FirebaseDatabase.instance.ref();
  var newTemp = RxInt(0);
  var smoke = RxInt(0);
  var status = RxString('');

  var isOn = false;
  RxBool isLoading = false.obs;
  final String userId;

  HomeController(this.userId);
  var switchControl = false;
  var totalDistance = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    tamperatureChange();
    smokeChange();
    retrieveTotalDistance();
    checkBatteryTemp();
    startLoading();
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

  void updateTotallDistance(double distance) {
    totalDistance.value = distance;
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

  Future<void> retrieveTotalDistance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? distance = prefs.getString('totalDistance_$userId');
    if (distance != null) {
      totalDistance.value = double.parse(distance);
    }
  }

  void checkBatteryTemp() {
    ever(newTemp, (value) {
      if (value != null && (value as int > 100)) {
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
