import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/AuthController.dart';
import '../utils/Color_constant.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthController authController = AuthController();
  final firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  var email = 'loading...';
  var name = 'loading...';

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() {
    firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      setState(() {
        name = snapshot.data()!['Name'];
        email = snapshot.data()!['Email'];
        print(_auth.currentUser!.uid);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorConstant.blueGray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: Text(
              'Profile',
              style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              child: CircleAvatar(
                backgroundColor: ColorConstant.blueGray900,
                backgroundImage: const AssetImage('images/ppic.png'),
                radius: 50,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 10, left: 30),
            child: ListTile(
              title: Text(
                'Name :',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Colors.white),
              ),
              trailing: Container(
                  padding: const EdgeInsets.only(right: 40),
                  child: Text(
                    name,
                    style: GoogleFonts.montserrat(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )),
              onTap: () {},
            ),
          ),
          Divider(
            color: ColorConstant.graydiv,
            height: 1,
          ),
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 10, left: 30),
            child: ListTile(
              title: Text(
                'E-mail :',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Colors.white),
              ),
              trailing: Container(
                  padding: const EdgeInsets.only(right: 35),
                  child: Flexible(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: AutoSizeText(
                        email,
                        maxLines: 1,
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
              ),
              onTap: () {},
            ),
          ),
          Divider(
            color: ColorConstant.graydiv,
            height: 2,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, bottom: 10, top: 15),
            child: ListTile(
              title: Text(
                'Change Password',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: ColorConstant.gray00,
              ),
              onTap: () {},
            ),
          ),
          Divider(
            color: ColorConstant.graydiv,
            height: 2,
          ),
        ],
      ),
    ));
  }
}
