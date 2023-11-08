// ignore_for_file: prefer_const_constructors, prefer_const_declarations, avoid_print

import 'package:flutter/foundation.dart';
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

            SizedBox(height: 20),
            // Different types of Button : 
              // Raised
              // Appears to be text

            // ignore: deprecated_member_use
            ElevatedButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Color(0xFF74B9FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                
              )  

              ,onPressed: (){
                debugPrint("I'm pressed"); //debugPrint returns only a string rather than an object{returned by print statement} 
              // print("Button Clicked");
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.ads_click_sharp,
                  color: Colors.red,),
                  SizedBox(width: 8),
                  Text("Click Me",)
                ],
              ),
            ),  
          ],
        ),
      ),
    );
  }
}
