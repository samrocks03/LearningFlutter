// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HourlyForecastWidget extends StatelessWidget {

  final String time; 
  final IconData icon;
  final String temperature; 
  const HourlyForecastWidget({
      super.key,
      required this.time,
      required this.icon,
      required this.temperature
    });

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
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    )
                ),
            
                SizedBox(height: 5),
            
                Icon(
                  icon,
                  size: 30,
                  ),
            
                SizedBox(height: 5),
            
                Text(temperature),
              ],
            ),
          )
        );
  }
}
