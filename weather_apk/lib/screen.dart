
// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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


/*
{
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1701864000,
      "main": {
        "temp": 277.43,
        "feels_like": 277.43,
        "temp_min": 277.43,
        "temp_max": 277.96,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1015,
        "humidity": 87,
        "temp_kf": -0.53
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
    .
    .
    .
    .
  }

  The data somewhat looks like this!
  representing a map with key at one side, value at other

  - key is string , and value is sometimes string and other times int i.e value is dynamic
  - Thus Future must return <String,dynamic>
  - making our return Future<Map<String,dynamic>> 
 */
    late Future<Map<String,dynamic>> weather;

    Future<Map<String,dynamic>> getCurrWeather() async{
      // Wrap it in try-catch block
      try{
        final String cityName = "solapur";
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

    String conv(double K) {
      return "${(K - 273.15).toStringAsPrecision(2)} °F";
    }

// Temporary commented out
  @override
  void initState() {
    super.initState();
    weather = getCurrWeather();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        // foregroundColor: Color.fromARGB(170, 170, 251, 249),
        // elevation : 10,
        title:
              const Text("Weather App",
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
              onPressed: (){
                setState(() {
                  weather = getCurrWeather();
                });
              },
              icon: const Icon(Icons.refresh_rounded)
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
            final currTemp = conv(currWeatherInfo['main']['temp']);
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
                elevation: 30,
          
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
                          Text(currTemp,
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
                child: const Text("Hourly Forecast",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                    ),
                  ),
              ),
          
              const SizedBox(height: 14,),
          
/*                    
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    

                    for(int i=1;i<=5;i++)
                      HourlyForecastWidget(
                        time: data['list'][i]['dt'].toString(),
                        // dt : 1701874800 // This represents mili seconds since Jan 1,1970
/*                            (currSky == "Clouds") ? 
                            Icons.cloud : (currSky == "Rain" ? Icons.water : Icons.sunny),
*/
                        icon: 
                          data['list'][i]['weather'][0]['main'] == "Clouds" 
                          ? Icons.cloud 
                          : (   data['list'][i]['weather'][0]['main'] == "Rain" 
                                ? Icons.water 
                                : Icons.wb_sunny_rounded
                            ),
                        temperature: "${data['list'][i]['main']['temp']} K",
                      ),        
                  ],
                ),
              ),
*/
/*Instead of loading all 4-5 widgets on screen, we will use listview.builder,
 if we load all 4-5 widgets on screen, it will affect the performance of app */
          
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context,index){
                    // final hourlyForecast = data['list'][index]['dt'].toString();
                    
                    final hf = data['list'][index+1];
                    final hourlyForecast = hf['dt_txt'];


                    final time = DateTime.parse(hourlyForecast);
                    final tempHourly = conv(hf['main']['temp']);//"${hf['main']['temp']}";
                    final ico = hf['weather'][0]['main'] == "Clouds" 
                                ? Icons.cloud 
                                : (data['list'][index]['weather'][0]['main'] == "Rain" 
                                ? Icons.water 
                                : Icons.wb_sunny_rounded);
                          
              
                    return HourlyForecastWidget(
                      time: DateFormat.Hm().format(time),
                      icon: ico, 
                      temperature: tempHourly);
                  },
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

