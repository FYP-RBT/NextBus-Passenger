import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CommonMethods{
  checkConnectivity(BuildContext context)async{
    var connectionResult = await Connectivity().checkConnectivity();

    if (connectionResult != ConnectivityResult.mobile && connectionResult != ConnectivityResult.wifi)
      {
        if(!context.mounted) return;
        snackBar(context, 'Internet is not Available, Try Again', Colors.cyan);

      }

  }



}

Future<void> snackBar(BuildContext context, String message, Color color) async {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(color: color, fontSize: 17.0),
    ),
  ));
}