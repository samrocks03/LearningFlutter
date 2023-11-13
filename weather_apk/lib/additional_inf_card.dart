// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

class AdditionalInformationCard extends StatelessWidget {
// Stateless widgets are immutable,
// Hence, using the final keyword for each 
  final IconData icon;
  final String weather_type;
  final String value;

  const AdditionalInformationCard({
    super.key,
    required this.icon,
    required this.weather_type,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Icon(
            icon,
            size: 30,
            ),
                        
          SizedBox(height: 10),
                        
          Text(weather_type),
                        
          Text(value,
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
                        
          // SizedBox(height: 10),      
        ],
      );
  }
}