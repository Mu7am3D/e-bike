import 'package:e_bike/Screens/Wallet.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  var points = 0;
  var balance = 0;
  final String userId;
  var point = 0.0.obs;
  WalletController(this.userId);

  @override
  void onInit() {
    super.onInit();
    loadPointsBalance();
    retrievePoints();
  }

  void loadPointsBalance() {
    firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      points = snapshot.data()!['Points'];
      balance = snapshot.data()!['Balance'];
      update(); // Notify GetBuilder that the data has changed
    });
  }

  Future<void> retrievePoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? distance = prefs.getString('totalDistance_$userId');
    if (distance != null) {
      point.value = double.parse(distance);
      update();
    }
  }

  void transfer() {
    print("pressed");
    double convertedBalance = (point / 1000) * 5;
    double remainingPoints = point % 1000;
    point.value = remainingPoints;
    balance += convertedBalance.toInt();

    firestore.collection("users").doc(_auth.currentUser!.uid).update({
      "Balance": balance + convertedBalance,
    });
    update();
  }
}
