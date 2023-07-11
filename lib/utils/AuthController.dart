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
  bool rememberMe = false;
  bool isLoading = false;
  late String newPassword;

  void visible() {
    isvisible = !isvisible;
    update();
  }

  void remember() {
    rememberMe = !rememberMe;
    update();
  }

  Future<void> checkRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    final rememberMeValue = prefs.getBool('rememberMe') ?? false;
    rememberMe = rememberMeValue;
  }

  Future<void> setRememberMe(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', value);
    rememberMe = value;
  }

  void loading() {
    isLoading = !isLoading;
    update();
  }

  Future<void> createAccount(BuildContext context) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: Emailcontroller.text, password: Passwordcontroller.text);
      final firestore = FirebaseFirestore.instance;
      firestore.collection('users').doc(user.user!.uid).set({
        "Email": Emailcontroller.text,
        "First Name": fNamecontroller.text,
        "Last Name": lNamecontroller.text,
        "Distance": 0,
        "Balance": 0,
      });
      if (user != null) {
        Get.to(() => const Nav());
        print(_auth.currentUser!.uid);
      } else {
        print('error');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showSnackBar(context, "The user already exists");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: EmailController.text, password: PasswordController.text);
      if (user != null) {
        // lets save user with shared prefrences

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("userID", user.user!.uid);
        print(user.user!.uid);
        Get.to(() => const Nav());
        print(_auth.currentUser!.uid);
      } else {
        print('error');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, "wrong email or password");
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, "wrong email or password");
      }
    }
  }

  Future<void> logoutUser() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("rememberMe", false);
    _storeOnboardInfo();
    Get.offAll(() => LoginApp());
  }

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: Emailcontroller.text);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> changePassword(String newPassword) async {
    try {
      await _auth.currentUser!.updatePassword(newPassword);
      print('Password changed successfully');
      logoutUser();
      showSnackBar(Get.context!, "Password changed successfully");
      Get.offAll(() => LoginApp());
    } catch (e) {
      print('Failed to change password: $e');
      showSnackBar(Get.context!, "Failed to change password");
    }
  }
}
