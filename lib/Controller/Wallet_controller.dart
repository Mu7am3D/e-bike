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
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadPointsBalance();
    startLoading();
  }

  void loadPointsBalance() {
    firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .snapshots() // Listen for real-time changes
        .listen((snapshot) {
      points = snapshot.data()!['Distance'];
      balance = snapshot.data()!['Balance'];
      update(); // Notify GetBuilder that the data has changed
    });
  }

  void transfer() {
    final int distanceToPointsRatio = 1000;
    final int pointsEarned = (points ~/ distanceToPointsRatio) * 5;

    int remainingDistance =
        points % distanceToPointsRatio; // Calculate remaining distance

    // Update Firestore document with new values
    firestore.collection("users").doc(_auth.currentUser!.uid).update({
      'Distance': remainingDistance,
      'Balance': FieldValue.increment(pointsEarned),
    }).then((_) {
      points = remainingDistance;
      update();
    }).catchError((error) {
      print("Error transferring distance to points: $error");
    });
  }

  void startLoading() {
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }
}
