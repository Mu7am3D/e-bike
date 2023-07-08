import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class HealthController extends GetxController {
  final DatabaseReference _dbref = FirebaseDatabase.instance.ref();
  var newTemp = RxInt(0);
  var heartRate = RxInt(0);
  var bloodOx = RxInt(0);
  var bloodPressure = ''.obs;
  bool isOn = false;

  @override
  void onInit() {
    super.onInit();
    tamperatureChange();
    heartBeat();
    oXPerc();
    bP();
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
