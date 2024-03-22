import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nextbus_passenger/comman_var.dart';

class StarTripPage extends StatefulWidget {
  const StarTripPage({super.key});

  @override
  State<StarTripPage> createState() => _StarTripPageState();
}

class _StarTripPageState extends State<StarTripPage> {
  final Completer<GoogleMapController> googleMapCompleterController = Completer<GoogleMapController>();
  GoogleMapController? controllerGoogleMap;

  Position? currentPositionOfUser;

  void updateMapTheme (GoogleMapController controller)
  {
    getJsonFileFromThemes('themes/map_night.json').then((value)=>setGoogleMapStyle(value,controller));
  }

  Future<String> getJsonFileFromThemes (String mapStylePath) async{
    ByteData byteData = await rootBundle.load(mapStylePath);
    var list = byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes);
    return utf8.decode(list);
  }

  setGoogleMapStyle(String googleMapStyle, GoogleMapController controller)
  {
    controller.setMapStyle(googleMapStyle);
  }

  getCurrentLiveLocationOfUser() async
  {
    Position positionOfUser = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPositionOfUser=positionOfUser;

    LatLng positionOfUserInLatLng=LatLng(currentPositionOfUser!.latitude, currentPositionOfUser!.longitude);

    CameraPosition cameraPosition = CameraPosition(target: positionOfUserInLatLng,zoom: 15);

    controllerGoogleMap!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(top: 40),
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: googleGooglePlexInitialPosition,
            onMapCreated: (GoogleMapController mapController){
                controllerGoogleMap=mapController;
                updateMapTheme(controllerGoogleMap!);
                googleMapCompleterController.complete(controllerGoogleMap);
                getCurrentLiveLocationOfUser();

            },

          ),
        ],
      ),
    );
  }
}
