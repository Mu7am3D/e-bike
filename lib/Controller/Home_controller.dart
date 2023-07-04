import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final DatabaseReference _dbref = FirebaseDatabase.instance.ref();
  var newTemp = RxInt(0);
  var smoke = RxInt(0);
  var status = RxString('');
  var isOn = false;
  var switchControl = false;

  @override
  void onInit() {
    super.onInit();
    tamperatureChange();
    smokeChange();
    flameSens();
  }

  void switchC() {
    switchControl = !switchControl;
    update();
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

  void flameSens() {
    _dbref.child('Flame sensor').child('Status').onValue.listen((event) {
      final data = event.snapshot.value;
      print('Status: $data');
      status.value = data.toString();
      update();
    });
  }
}
