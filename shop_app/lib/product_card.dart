// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title, required this.price, required this.image, required this.bgColor
  });

  final String title;
  final double price;
  final String image;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // can use either a card/ container,
      // but, container wont use elevation property,
      // hence go with container
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),


      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 5),
            Text("\$ $price"),
            // Image(image: AssetImage(image))
            Center(
              child: Image.asset(
                image,
                height: 160
              ),
            )
          ]
        ),
      ),
    );
  }
}