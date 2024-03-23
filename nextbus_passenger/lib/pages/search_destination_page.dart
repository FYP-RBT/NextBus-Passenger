import 'package:flutter/material.dart';
import 'package:nextbus_passenger/pages/startTripPage.dart';

import '../colors.dart';
import '../methods/sizes.dart';

class SearchDestinationPage extends StatefulWidget {
  const SearchDestinationPage({super.key});

  @override
  State<SearchDestinationPage> createState() => _SearchDestinationPageState();
}



class _SearchDestinationPageState extends State<SearchDestinationPage>
{
  TextEditingController getINTextEditingController = TextEditingController();
  TextEditingController destinationTextEditingController = TextEditingController();



  @override
  Widget build(BuildContext context)
  {
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

          ],
        ),
      ),
    );
  }
}
