import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class HealthController extends GetxController {
  final DatabaseReference _dbref = FirebaseDatabase.instance.ref();
  var newTemp = RxInt(0);
  bool isOn = false;

  @override
  void onInit() {
    super.onInit();
    tamperatureChange();
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

  void toggle() {
    isOn = !isOn;
    update();
  }
}
