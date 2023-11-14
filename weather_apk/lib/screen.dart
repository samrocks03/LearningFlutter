
// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_apk/additional_inf_card.dart';
import 'package:weather_apk/hourly_forecast_card.dart';
import 'package:http/http.dart' as http;
import 'package:weather_apk/secrets.dart';

class WeatherApp extends StatefulWidget {


  const WeatherApp({super.key});
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {


    Future getCurrWeather() async{
      try{
        final String cityName = "London";
        final res = await http.get(
          Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=$cityName,uk&APPID=$apiKey")
        );
        // debugPrint(res.body);
        final data = jsonDecode(res.body);

        if(data['cod'] != "200"){
            throw "Unexpected error occurred";
        }
        return data;

          // temp = data['list'][0]['main']['temp'];
      }
      catch(e){
        throw e.toString();
      }
  }


  @override
  void initState() {
    super.initState();
    getCurrWeather();
  }
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


      body: 
        Padding(
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
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text("200 K",
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
                  
                  HourlyForecastWidget(
                    time: "12:00",
                    icon: Icons.wb_sunny_rounded,
                    temperature: "17 °F",
                  ),
                  
                  HourlyForecastWidget(
                    time: "12:00",
                    icon: Icons.wb_sunny_rounded,
                    temperature: "17 °F",
                  ),

                  HourlyForecastWidget(
                    time: "12:00",
                    icon: Icons.wb_sunny_rounded,
                    temperature: "17 °F",                    
                  ),
                  
                  HourlyForecastWidget(
                    time: "12:00",
                    icon: Icons.wb_sunny_rounded,
                    temperature: "17 °F",                    
                  ),
                  
                  HourlyForecastWidget(
                    time: "12:00",
                    icon: Icons.wb_sunny_rounded,
                    temperature: "17 °F",                    
                  ),
                              
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                    AdditionalInformationCard(
                      icon: Icons.water_drop_rounded,
                      weather_type: "Humidity",
                      value: "91%",
                    ),

                    AdditionalInformationCard(
                      icon: Icons.air_sharp,
                      weather_type: "Wind Speed",
                      value: "7.5",
                    ),                    
                    
                    AdditionalInformationCard(
                      icon: Icons.beach_access_rounded,
                      weather_type: "Pressure",
                      value: "1005",

                    ),                    
                ],
            )
          ],
        ),
      ),
    );
  }
}

