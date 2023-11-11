
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
        padding:  EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Main card for Current Weather forecast
            // Placeholder(
            //   fallbackHeight: 250,
            //   child: Text("Main Cards"),
            // ),
      
          Container(
            width: double.infinity,
            child: Card(
              shape : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50) 
                  ),  
              elevation: 50,

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
            const SizedBox(height: 40,),
      
            Placeholder(
              fallbackHeight: 150,
              child: Text("Weather Forecast Sliding Cards"),
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