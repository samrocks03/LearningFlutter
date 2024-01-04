// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          primary: Color.fromRGBO(254, 206, 1, 1),
          secondary: Color.fromRGBO(245, 247, 249, 1),
          seedColor: Color.fromRGBO(254, 206, 1, 1)
        ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: GoogleFonts.abhayaLibre(
            fontSize: 15
            ) ,
          prefixIconColor: Color.fromRGBO(119,119,119,1)
        )
        ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}