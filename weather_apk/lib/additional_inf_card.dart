// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AdditionalInformationCard extends StatelessWidget {
// Stateless widgets are immutable,
// Hence, using the final keyword for each 
  final IconData icon;


  const AdditionalInformationCard({
    super.key,
    required this.icon,
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
                        
          Text("Humidity"),
                        
          Text("94",
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
                        
          // SizedBox(height: 10),      
        ],
      );
  }
}