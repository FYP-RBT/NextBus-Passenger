import 'dart:async';

import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: googleGooglePlexInitialPosition,
            onMapCreated: (GoogleMapController mapController){
                controllerGoogleMap=mapController;
                googleMapCompleterController.complete(controllerGoogleMap);

            },

          ),
        ],
      ),
    );
  }
}
