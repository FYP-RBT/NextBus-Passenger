import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nextbus_passenger/comman_var.dart';
import 'package:nextbus_passenger/methods/commonMethods.dart';
import 'package:nextbus_passenger/pages/search_destination_page.dart';

import '../colors.dart';
import 'homePage.dart';

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
    
    await CommonMethods.convertGeoGraphicCoOrdinatesIntoHumanReadableAddress(currentPositionOfUser!, context);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          //Google Map
          GoogleMap(
            padding: EdgeInsets.only(top: 50,bottom: 300),
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

          //drawer button
          Positioned(
            top: 60,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const
                [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child:  CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: AppColor.iconColor,
                    )),
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: -50,
            child: Container(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (c)=> SearchDestinationPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24)
                    ),
                    child:  Icon(
                      Icons.search,
                      color: AppColor.iconColor,
                      size: 25,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24)
                    ),
                    child:  Icon(
                      Icons.home,
                      color: AppColor.iconColor,
                      size: 25,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24)
                    ),
                    child:  Icon(
                      Icons.work,
                      color: AppColor.iconColor,
                      size: 25,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
