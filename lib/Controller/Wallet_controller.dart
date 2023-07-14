import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
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
    const int pointsToBalanceRatio = 10; // each 10 m or points equal 5$
    final int balanceEarned = (points ~/ pointsToBalanceRatio) * 5;

    int remainingDistance =
        points % pointsToBalanceRatio; // Calculate remaining distance

    // Update Firestore document with new values
    firestore.collection("users").doc(_auth.currentUser!.uid).update({
      'Distance': remainingDistance,
      'Balance': FieldValue.increment(balanceEarned),
    }).then((_) {
      points = remainingDistance;
      showSnackBar(Get.context!, "Transfered successfully");
      update();
    }).catchError((error) {
      showSnackBar(Get.context!, "Failed to transfer the points to balance");
    });
  }

  void startLoading() {
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }
}
