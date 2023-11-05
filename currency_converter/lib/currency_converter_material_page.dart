import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ColoredBox(
        color: Color.fromRGBO(255, 0, 255, 0.18),
        child: Center(
          child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Align the main axis to center
              children: [
                Text(
                  "Helu Bru",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(240, 3, 33, 37),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: 14.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Enter the amount in USD!"),
                      icon: Padding(
                        padding: EdgeInsets.only(left: 14.0),
                        child: Icon(Icons.attach_money_sharp),
                      ),
                      // labelText: 'Enter your Email',
                    ),
                  ),
                )
              ]),
      ),
    ));
  }
}
