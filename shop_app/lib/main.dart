// ignore_for_file: prefer_const_constructors
// main.dart
// import 'package:shop_app/cart_page.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}


// ignore: slash_for_doc_comments
/**
 * Types of Provider:
 *  - Provider                      --> Read Only value
 *  - ChangeNotifier Provider       --> Change the value, notify the widgets that are listening to it about their changes.
 *  - Future Provider               --> 
 *  - Stream Provider
 *                                    Future and Stream provider help in doing lazy loaders task
 * 
 * Info about short Hand notation:
 *  context.read() cannot be called in build function
 *  context.watch() cannot be called outside build function
 * 
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // build func
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
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
            ),
            prefixIconColor: Color.fromRGBO(119,119,119,1)
          ),
      
          appBarTheme: AppBarTheme(
            titleTextStyle: GoogleFonts.aBeeZee(
              fontSize: 25,
              color: Colors.black
            )
          ),
      
          textTheme: TextTheme(
            titleMedium: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
      
            bodyMedium:GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),
      
            bodySmall:GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
      
            titleLarge: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                      color: Colors.blue.shade900,
                      letterSpacing: .3,
                      fontSize: 30,
                      fontWeight: FontWeight.w900
                    ),
              ),
          )
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}