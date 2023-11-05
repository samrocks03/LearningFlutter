import 'package:currency_converter/currency_converter_material_page.dart';
import 'package:flutter/cupertino.dart';
// ignore: unnecessary_import
import 'package:flutter/material.dart';

void main() {
  // runApp(// const Text("Hello!!!", textDirection: TextDirection.rtl),);
  runApp(const MyApp());
}

// Types of widgets:
/*
  - Stateless
  - Stateful
  - Inherited
 */

/*  
State : state refers to the data that can change in a widget. 
Stateless widgets :  immutable, meaning they cannot change during runtime. 
Stateful widgets : on the other hand, can change during runtime. When the state of a widget changes, the widget is rebuilt to reflect the new state.
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CurrencyConverterMaterialPage(),
    );
  }
}
