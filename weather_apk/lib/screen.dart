
// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        // foregroundColor: Color.fromARGB(170, 170, 251, 243),
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
                  fontSize: 23,
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
      
            Placeholder(
              fallbackHeight: 150,
              child: Text("Other Information Cards"),
            ),
            
          ],
        ),
      ),
    );
  }
}

class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 50,
          shape : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20) 
            ),

          child : Container(
            width: 100,
            padding: EdgeInsets.all(4.0),
            child: Column(
              children: [
                Text("3:00",
                  style: TextStyle(
                    fontSize: 14,
                  )
                ),
            
                SizedBox(height: 5),
            
                Icon(
                  Icons.cloud_queue_sharp,
                  size: 30,
                  ),
            
                SizedBox(height: 5),
            
                Text("14 °F",),
              ],
            ),
          )
        );
  }
}