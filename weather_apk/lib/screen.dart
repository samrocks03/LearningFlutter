
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

/*
  (new) FutureBuilder<Map<String, dynamic>> FutureBuilder({
    Key? key,
    required Future<Map<String, dynamic>>? future,
    Map<String, dynamic>? initialData,
    required Widget Function(BuildContext, AsyncSnapshot<Map<String, dynamic>>) builder,
  })
*/

// Since, we have to pass the value of this function into FutureBuilder, hence set the return type to .... 
// Future<Map<String,dynamic>> ?future
    Future<Map<String,dynamic>> getCurrWeather() async{
      // Wrap it in try-catch block
      try{
        final String cityName = "London,uk";
        final res = await http.get(
              Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$apiKey")
            );
        // Uri : Uniform resource identifier
        // debugPrint(res.body);
        final data = jsonDecode(res.body);

        // uncomment this, if you dont want the string notation ex. "200"
        // if(data['cod'] != 200.toString()){
        if(data['cod'] != "200"){
            throw data["message"];
        }
        return data;
          // temp = data['list'][0]['main']['temp'];
      }
      catch(e){
        // throw the error, if some error is recieved
          throw "        $e";
      }
    }

/*
// Temporary commented out
  @override
  void initState() {
    super.initState();
    getCurrWeather();
  }
*/
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
        FutureBuilder(
          // Future builder is useful - when we are dealing with Future 
          future: getCurrWeather(),
          builder: (context,snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            if(snapshot.hasError){
               return Text(snapshot.error.toString());
            }

            final data = snapshot.data;

            final currWeatherInfo = data!['list'][0];
            final currTemp = currWeatherInfo['main']['temp'];
            final currSky = currWeatherInfo['weather'][0]['main'];

            final currPressure = currWeatherInfo['main']['pressure'];
            final currHumidity = currWeatherInfo['main']['humidity'];

            final windSpeed = currWeatherInfo['wind']['speed'];

            // print(currSky);
            // final currWeatherTemp = data![]
            return Padding(
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
                          Text("$currTemp K",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            )
                            ),
                    
                          SizedBox(
                            width: 20,
                          ),
                    
                          Icon(
                            (currSky == "Clouds") ? 
                            Icons.cloud : (currSky == "Rain" ? Icons.water : Icons.sunny),
                            size: 60,
                            ),
                    
                          SizedBox(
                            width: 20,
                          ),
                          
                          Text("$currSky",
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
                        value: "$currHumidity",
                      ),
          
                      AdditionalInformationCard(
                        icon: Icons.air_sharp,
                        weather_type: "Wind Speed",
                        value: "$windSpeed",
                      ),                    
                      
                      AdditionalInformationCard(
                        icon: Icons.beach_access_rounded,
                        weather_type: "Pressure",
                        value: "$currPressure",
                      ),                    
                  ],
              )
            ],
          ),
              );
          },
        ),
    );
  }
}

