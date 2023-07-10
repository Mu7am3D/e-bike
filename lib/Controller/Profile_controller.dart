import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  var email = 'loading...';
  var name = 'loading...';
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    startLoading();
  }

  void startLoading() {
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }

  void loadUserData() {
    firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      String firstName = snapshot.data()!['First Name'];
      String lastName = snapshot.data()!['Last Name'];
      name = '$firstName $lastName';
      email = snapshot.data()!['Email'];
      update(); // Notify GetBuilder that the data has changed
    });
  }
}
