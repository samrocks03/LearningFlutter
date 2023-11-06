import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 66, 66, 171),
      // backgroundColor: MaterialAccentColor(700),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Currency Converter",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent, // Changed text color to black
              ),
            ),
            const SizedBox(height: 20),
            Container(
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white,
                fontStyle:FontStyle.italic
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter the amount in USD",
                  hintStyle: TextStyle(color: Colors.grey),
                  
                  prefixIcon: Icon(Icons.attach_money_sharp, color: Color(0xFF74B9FF)),
                  suffixIcon: Icon(Icons.attach_money_sharp, color: Color(0xFF74B9FF)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurpleAccent,
                      width: 2,
                      style: BorderStyle.solid,
                      strokeAlign : BorderSide.strokeAlignInside,
                      ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
