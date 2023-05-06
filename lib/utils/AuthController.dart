
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Nav Bar/Nav_bar.dart';
import '../Screens/login.dart';

class AuthController extends GetxController {
  final TextEditingController Emailcontroller = TextEditingController();
  final TextEditingController Passwordcontroller = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController Namecontroller = TextEditingController();
  final TextEditingController fNamecontroller = TextEditingController();
  final TextEditingController lNamecontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isvisible = false;
  bool isremebered = false;

  void visible() {
    isvisible = !isvisible;
    update();
  }
  void remeber() {
    isremebered = !isremebered;
    update();
  }

  Future<void> createAccount() async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: Emailcontroller.text, password: Passwordcontroller.text);
      final firestore = FirebaseFirestore.instance;
      firestore.collection('users').doc(user.user!.uid).set(
          {
            "Email": Emailcontroller.text,
            "First Name": fNamecontroller.text,
            "Last Name": lNamecontroller.text,
            "profpic": " "
          });
      if (user != null) {
        Get.to(() => Nav());
        print(_auth.currentUser!.uid);
      } else {
        print('error');
      }
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  Future<void> loginUser() async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: EmailController.text,
          password: PasswordController.text);
      if (user != null) {
        // lets save user with shared prefrences

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("userID", user.user!.uid);
        print(user.user!.uid);
        Get.to(() => Nav());
        print(_auth.currentUser!.uid);
      } else {
        print('error');
      }
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  Future<void> logoutUser() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    _storeOnboardInfo();
    Get.offAll(() => LoginApp1());
  }
  _storeOnboardInfo() async{
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }
}