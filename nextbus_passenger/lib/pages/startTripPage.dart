import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  GoogleMapController? mapController;
  Position? currentPosition; // Stores the user's current position

  final LatLng _center = const LatLng(37.7749, -122.4194); // Initial map center coordinates

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Get the user's current location
  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map View'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: currentPosition != null
                    ? LatLng(currentPosition!.latitude, currentPosition!.longitude)
                    : _center,
                zoom: 15.0,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _getCurrentLocation,
            child: Text('Get Current Location'),
          ),
        ],
      ),
    );
  }
}
