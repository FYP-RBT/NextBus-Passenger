import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String userName = '';
String userEmail = '';
String userPhone = "";
String userID = FirebaseAuth.instance.currentUser!.uid;
String serverKeyFCM = "key=AAAAkILGJCQ:APA91bGGkIlyfBRVGuSWJPG4JqXB0p8g7lTJz0iigeloYvrvjTkxOvm0j8to2cevmoXykMRiEk7XoKwhjW3tNJ0m6SAHcgTubFQFM84k2CBtemQxAytNcK4FvT3D3Q7aozeDld7mGgGc";
String googleMapKey="AIzaSyBsxELn_PL513ny9ZMo8AORfg0tf-m2aKk";


const CameraPosition googleGooglePlexInitialPosition = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);