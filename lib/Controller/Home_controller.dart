import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  final DatabaseReference _dbref = FirebaseDatabase.instance.ref();
  var newTemp = RxInt(0);
  var smoke = RxInt(0);
  var status = RxString('');
  var isOn = false;
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
  }

  void switchC() {
    switchControl = !switchControl;
    update();
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
}
