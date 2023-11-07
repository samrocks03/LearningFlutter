// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {

    final border =  const OutlineInputBorder(
                  borderSide: BorderSide(
                     color: Color(0xFF74B9FF),
                    width: 2,
                    style: BorderStyle.solid,
                    strokeAlign : BorderSide.strokeAlignInside,
                    ),
                  
                  borderRadius: BorderRadius.all(
                    Radius.circular(40)
                    ),
                  );


    return  Scaffold(
      backgroundColor: Color.fromARGB(0, 66, 66, 171),
      // backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              // color: Colors.black,
              child: Text(
                "Currency Converter",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF74B9FF), // Changed text color to black
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(
                color: Color(0xFF74B9FF),
                fontStyle:FontStyle.italic
                ),
                
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter the amount in USD",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor:Color.fromARGB(255, 88, 88, 88),
                  prefixIcon: Icon(Icons.attach_money_sharp,
                     color: Color(0xFF74B9FF)
                   ),
            
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
