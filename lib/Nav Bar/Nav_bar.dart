import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Screens/Health.dart';
import '../Screens/Home.dart';
import '../Screens/Lock.dart';
import '../Screens/Navigation.dart';
import '../Screens/Weather.dart';
import '../utils/Color_constant.dart';
class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _item = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages(),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: ColorConstant.gray10,
          selectedItemColor: ColorConstant.blueGray900,
          onTap:(index){
            setState(() {
              _item = index;
            });
          },
          currentIndex: _item,
          type: BottomNavigationBarType.fixed,
          items:  [

            BottomNavigationBarItem(icon: SvgPicture.asset('images/home.svg'),label: 'Home',),
            BottomNavigationBarItem(icon: SvgPicture.asset("images/nav.svg"),label:
            'Navigation'),

            BottomNavigationBarItem(icon: SvgPicture.asset("images/weather.svg"),label: 'Weather'),
            BottomNavigationBarItem(icon: SvgPicture.asset('images/health.svg'),label: 'Health'),
            BottomNavigationBarItem(icon: SvgPicture.asset('images/lock.svg'),label: 'Lock'),
          ]),
    );
  }
  Widget pages (){
    switch(_item){
      case 0 : return Home();
      case 1 : return Navigation();
      case 2: return Weather();
      case 3 : return Health();
      case 4 : return Lock();
      default: return Container();

    }

  }
}