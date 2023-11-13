
// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_apk/additional_inf_card.dart';
import 'package:weather_apk/hourly_forecast_card.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        // foregroundColor: Color.fromARGB(170, 170, 251, 249),
        // elevation : 10,
        title:
              const Text("Weather Detector",
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,              
            ),
            ),
          centerTitle: true,
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            // ignore: prefer_const_constructors
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.refresh_sharp)
            )
          ]
      ),


      body: Padding(
        // ignore: prefer_const_constructors
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment : CrossAxisAlignment.start,
          children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              shape : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20) 
                  ),  
              elevation: 50,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                // clipper: CustomClipper(RRect().),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 1.9,
                    sigmaY: 1.9,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text("17 °F",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          )
                          ),
                  
                        SizedBox(
                          width: 20,
                        ),
                  
                        Icon(
                          Icons.water,
                          size: 60,
                          ),
                  
                        SizedBox(
                          width: 20,
                        ),
                        
                        Text("Rain",
                          style: TextStyle(
                            fontSize: 20,
                          )
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

            const SizedBox(height: 40,),

            Align(
              alignment : Alignment.centerLeft,
              child: const Text("Weather Forecast",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                  ),
                ),
            ),

            const SizedBox(height: 14,),


            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  
                  HourlyForecastWidget(),
                  
                  HourlyForecastWidget(),

                  HourlyForecastWidget(),
                  
                  HourlyForecastWidget(),
                  
                  HourlyForecastWidget(),
                              
                ],
              ),
            ),

            SizedBox(height: 40,),


            Text(
              "Additional Forecast",
              style : TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              )
            ),

            SizedBox(height: 14,),

            Row(
              children: [
                    AdditionalInformationCard(),

                    AdditionalInformationCard(),                    
                    
                    AdditionalInformationCard(),                    
                ],
            )
          ],
        ),
      ),
    );
  }
}

