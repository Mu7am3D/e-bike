import 'dart:async';
import 'package:e_bike/Constants/Color_constant.dart';
import 'package:e_bike/CustomWidget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:e_bike/helpers/location_helper1.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static Position? position;
  Completer<GoogleMapController> _mapController1 = Completer();

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
    position = await LocationHelper1.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  @override
  initState() {
    super.initState();
    getMyCurrentLocation();
    buildCurrentLocationMarker();
    // Add this line to add the current location marker
  }

  final databaseReference = FirebaseDatabase.instance.ref();

  void buildCurrentLocationMarker() {
    databaseReference.child('Location').onValue.listen((event) {
      final snapshot = event.snapshot;
      final value = snapshot.value as Map<dynamic, dynamic>?;

      if (value != null) {
        final latitude = double.parse(value['latitude'].toString());
        final longitude = double.parse(value['longitude'].toString());
        print(latitude);

        currentLocationMarker = Marker(
          position: LatLng(latitude, longitude),
          markerId: MarkerId('1'),
          onTap: () {},
          infoWindow: InfoWindow(
            title: "Bike Loc: $latitude, $longitude",
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        );
        addMarkerToMarkersAndUpdateUI(currentLocationMarker);
        setState(() {});
      }
    });
  }

  void addMarkerToMarkersAndUpdateUI(Marker marker) {
    setState(() {
      markers.add(marker);
    });
  }

  Widget buildMap() {
    final LatLng targetLocation =
        LatLng(position!.latitude, position!.longitude);

    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: _myCurrentLocationCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _mapController1.complete(controller);
      },
      markers: markers,
      // Use the 'markers' set here
    );
  }

  void _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController1.future;
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
            _goToMyCurrentLocation();
          },
          child: Icon(Icons.place, color: Colors.white),
        ),
      ),
    );
  }
}
