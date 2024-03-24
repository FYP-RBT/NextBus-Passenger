import 'package:flutter/material.dart';
import 'package:nextbus_passenger/pages/startTripPage.dart';
import 'package:provider/provider.dart';

import '../appInfo/app_info.dart';
import '../colors.dart';
import '../comman_var.dart';
import '../componants/prediction_place_ui.dart';
import '../methods/commonMethods.dart';
import '../methods/sizes.dart';
import '../models/prediction_model.dart';

class SearchDestinationPage extends StatefulWidget {
  const SearchDestinationPage({super.key});

  @override
  State<SearchDestinationPage> createState() => _SearchDestinationPageState();
}



class _SearchDestinationPageState extends State<SearchDestinationPage>
{
  TextEditingController getINTextEditingController = TextEditingController();
  TextEditingController destinationTextEditingController = TextEditingController();

  List<PredictionModel> dropOffPredictionsPlacesList = [];

  ///Places API - Place AutoComplete
  searchLocation(String locationName) async
  {
    if(locationName.length > 1)
    {
      String apiPlacesUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$locationName&key=$googleMapKey&components=country:lk";

      var responseFromPlacesAPI = await CommonMethods.sendRequestToAPI(apiPlacesUrl);

      if(responseFromPlacesAPI == "error")
      {
        return;
      }

      if(responseFromPlacesAPI["status"] == "OK")
      {
        var predictionResultInJson = responseFromPlacesAPI["predictions"];
        var predictionsList = (predictionResultInJson as List).map((eachPlacePrediction) => PredictionModel.fromJson(eachPlacePrediction)).toList();

        setState(() {
          dropOffPredictionsPlacesList = predictionsList;
        });

        print('Prediction Result: $predictionResultInJson');
      }
    }
  }



  @override
  Widget build(BuildContext context)
  {
    String userAddress = Provider.of<AppInfo>(context, listen: false).pickUpLocation?.humanReadableAddress ?? "";
    getINTextEditingController.text = userAddress;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              width: getPageWidth(context),
              height: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColor.lightBlueBack),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StarTripPage()),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: AppColor.iconColor,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.5),
                    child: Text(
                      'Set Destination Location',
                      style: TextStyle(fontSize: 22, color: AppColor.iconColor),
                    ),
                  )
                ],
              ),
            ),

            Card(
              elevation: 10,
              child: Container(
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow:
                  [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7),
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24,),
                  child: Column(
                    children: [

                      const SizedBox(height: 6,),

                      //icon button - title
                      Stack(
                        children: [



                        ],
                      ),

                      const SizedBox(height: 18,),

                      //pickup text field
                      Row(
                        children: [

                          Icon(Icons.location_on_rounded,color: Colors.blueAccent,),

                          const SizedBox(width: 18,),

                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade500,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: TextField(
                                  controller: getINTextEditingController,
                                  decoration: const InputDecoration(
                                    hintText: "GetIn Address",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(left: 11, top: 9, bottom: 9)
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                      const SizedBox(height: 11,),

                      //destination text field
                      Row(
                        children: [

                          Icon(Icons.location_on_rounded,color: Colors.green,),

                          const SizedBox(width: 18,),

                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade500,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: TextField(
                                  controller: destinationTextEditingController,
                                  onChanged: (inputText)
                                  {
                                    searchLocation(inputText);
                                  },
                                  decoration: const InputDecoration(
                                      hintText: "Destination Address",
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.only(left: 11, top: 9, bottom: 9)
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),

            //display prediction results for destination place
            (dropOffPredictionsPlacesList.length > 0)
                ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListView.separated(
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index)
                {
                  return Card(
                    elevation: 3,
                    child: PredictionPlaceUI(
                      predictedPlaceData: dropOffPredictionsPlacesList[index],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 2,),
                itemCount: dropOffPredictionsPlacesList.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
              ),
            )
                : Container(),

          ],
        ),
      ),
    );
  }
}
