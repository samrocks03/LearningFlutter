// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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
            width: 90,
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
