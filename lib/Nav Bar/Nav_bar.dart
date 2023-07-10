import 'package:e_bike/Screens/health.dart';
import 'package:e_bike/Screens/NavigationTest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Screens/home.dart';
import '../Screens/lock.dart';
import '../Screens/WeatherView.dart';
import '../Constants/Color_constant.dart';
import 'package:e_bike/business_logic/cubit/maps/maps_cubit.dart';
import 'package:e_bike/data/repository/maps_repo.dart';
import 'package:e_bike/data/webservices/places_webservices.dart';
// Import the MapScreen widget

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  late MapsCubit mapsCubit;
  int _item = 0;

  @override
  void initState() {
    super.initState();
    mapsCubit = MapsCubit(MapsRepository(PlacesWebservices()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstant.gray10,
        selectedItemColor: ColorConstant.blueGray900,
        onTap: (index) {
          setState(() {
            _item = index;
          });
        },
        currentIndex: _item,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/home.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("images/nav.svg"),
            label: 'Navigation',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("images/weather.svg"),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/health.svg'),
            label: 'Health',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/lock.svg'),
            label: 'Lock',
          ),
        ],
      ),
    );
  }

  Widget _buildScreen() {
    switch (_item) {
      case 0:
        return HomeView();
      case 1:
        return BlocProvider.value(
          value: mapsCubit,
          child: MapScreen1(),
        );
      case 2:
        return WeatherView();
      case 3:
        return HealthView();
      case 4:
        return const Lock();
      default:
        return Container();
    }
  }
}
