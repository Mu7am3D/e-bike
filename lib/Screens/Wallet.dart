import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/Color_constant.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
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
            padding: const EdgeInsets.only(left: 40, top: 5),
            child: Text(
              'Wallet',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w800,
                fontSize: 24,
                color: Colors.white
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset('images/carddd.png'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 27, left: 20),
                child: Image.asset('images/tst.png'),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 48, left: 210),
                  child: Text(
                    'Weekly Points',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                    ),
                  )),
              Container(
                padding: const EdgeInsets.only(top: 85, left: 315),
                child: Text(
                  '200',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              ),
              Container(margin: const EdgeInsets.only(left: 220,top: 190),
                width: 131,
                height: 40,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      ColorConstant.whiteA700.withOpacity(0.5),
                      ColorConstant.whiteB700.withOpacity(0.5)
                    ]),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Transfer',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                      ),
                    )),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 25,bottom: 10),
            child: ListTile(
                title: Text(
                  'Points :',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Colors.white
                  ),
                ),
                trailing: Container(padding:const EdgeInsets.only(bottom: 10,right: 95) ,child: Text('241',style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
                )
                ),
                onTap: () {}
            ),
          ),
          Divider(
            color: ColorConstant.graydiv,
            height: 1,
          ),
          Container(
            padding: const EdgeInsets.only(left: 25,bottom: 10,top: 10),
            child: ListTile(
                title: Text(
                  'Balance :',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Colors.white
                  ),
                ),
                trailing: Container(padding:const EdgeInsets.only(bottom: 10,right: 40) ,child: Text('\$ 10.50',style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
                )),
                onTap: () {}
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
