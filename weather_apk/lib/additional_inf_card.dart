// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AdditionalInformationCard extends StatelessWidget {
  const AdditionalInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
      return Card(
          child : Container(
            padding: EdgeInsets.all(9),
            child: Column(
              children: [
                Icon(Icons.water_drop_rounded,
                  size: 30,
                  ),
                              
                SizedBox(height: 10),
                              
                Text("Humidity"),
                              
                Text("94",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                              
                // SizedBox(height: 10),      
              ],
            ),
          )
        );
  }
}