// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

  final border = OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(40))         
                        );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Shoes\nCollection",
                    style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                          // color: Colors.blue,
                          letterSpacing: .5,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                      ),

                    ),
                  ),

                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: border,
                        enabledBorder: border
                      ),
                      keyboardType: TextInputType.emailAddress
                    ),
                  )
                ]
            ,)
          ],
        ),
      ),
    );
  }
}