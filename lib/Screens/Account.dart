import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/Color_constant.dart';
import 'Payment.dart';
import 'Profile.dart';
import 'Wallet.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorConstant.blueGray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(padding: EdgeInsets.only(left: 40, top: 10),
              child: Text(
                'Account',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white
                ),
              ),
            ),
              SizedBox(
                height: 20,
              ),Container(
                padding: EdgeInsets.only(left: 30,bottom: 10),
                child: ListTile(
                  title: Text(
                    'Profile',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Colors.white
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorConstant.gray00,
                  ),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Profile())),
                ),
              ),
              Divider(
                color: ColorConstant.graydiv,
                height: 1,
              ),
              Container(
                padding: EdgeInsets.only(left: 30,bottom: 20,top: 25),
                child: ListTile(
                  title: Text(
                    'Payment',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Colors.white
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorConstant.gray00,
                  ),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Payment())),
                ),
              ),
              Divider(
                color: ColorConstant.graydiv,
                height: 1,
              ),
              Container(
                padding: EdgeInsets.only(left: 30,bottom: 20,top: 25),
                child: ListTile(
                  title: Text(
                    'Wallet',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Colors.white
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorConstant.gray00,
                  ),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Wallet())),
                ),
              ),
              Divider(
                color: ColorConstant.graydiv,
                height: 2,
              ),

          ],),
    ));
  }
}
