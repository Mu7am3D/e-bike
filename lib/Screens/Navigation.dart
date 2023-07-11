import 'dart:async';
import 'package:e_bike/Constants/Color_constant.dart';
import 'package:e_bike/CustomWidget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:e_bike/helpers/location_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static Position? position;
  Completer<GoogleMapController> _mapController = Completer();

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );
  Set<Marker> markers = Set();
  late Marker searchedPlaceMarker;
  late Marker currentLocationMarker;
  late CameraPosition goToSearchedForPlace;

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> getLatLng() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Center(
                child: Column(
                  children: [
                    Text("${LatLng(position!.latitude, position!.longitude)}"),
                  ],
                ),
              ),
              title: Text("Your current Location"),
            ));
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    getMyCurrentLocation();
    getLatLng();
  }

  void buildCurrentLocationMarker() {
    currentLocationMarker = Marker(
      position: LatLng(position!.latitude, position!.longitude),
      markerId: MarkerId('2'),
      onTap: () {},
      infoWindow: InfoWindow(title: "Your Bicycle Location"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    addMarkerToMarkersAndUpdateUI(currentLocationMarker);
    setState(() {});
  }

  void addMarkerToMarkersAndUpdateUI(Marker marker) {
    setState(() {
      markers.add(marker);
    });
  }

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: _myCurrentLocationCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
      markers: {
        Marker(
            markerId: MarkerId("Bicycle"),
            position: LatLng(position!.latitude, position!.longitude),
            infoWindow: InfoWindow(title: "Your Bike Location"))
      },
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        width: 290,
      ),
      body: Stack(
        children: [
          position != null
              ? buildMap()
              : Center(
                  child: Container(
                    child: CircularProgressIndicator(
                      color: ColorConstant.blue,
                    ),
                  ),
                ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          backgroundColor: ColorConstant.blue,
          onPressed: () {
            _goToMyCurrentLocation;
            getLatLng();
          },
          child: Icon(Icons.place, color: Colors.white),
        ),
      ),
    );
  }
}
