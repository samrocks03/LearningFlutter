// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filter = const ['All','Adidas','Nike','Bata'];
  // you can't use initialized value again, to initialize another value.
  // so, make the 👇 late
  //   
  late String filterSelector;

  @override
  void initState() {
    super.initState();
    filterSelector = filter[0];
  }


  @override
  Widget build(BuildContext context) {
    // print("filter selecteD $filterSelector"); 
    final border = OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomRight: Radius.circular(40)));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                          color: Colors.blue.shade900,
                          letterSpacing: .3,
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
                          /*here, border is the final
                                          variable returning OutlineInputBorder with defined properties
                                        */
                          fillColor: Colors.amber,
                          enabledBorder: border),
                      keyboardType: TextInputType.emailAddress),
                )
              ],
            ),

            

            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                itemCount: filter.length,
                itemBuilder: (context,index){
                  final filt = filter[index];

                  return Padding(  // this padding was provided above the chip
                    padding: const EdgeInsets.symmetric(horizontal: 9.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          // save the selected filter as the value getting tapped by the gesture 
                          filterSelector = filt;                          
                        });
                      },

                      child: Chip(
                        backgroundColor: filterSelector == filt
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).secondaryHeaderColor,
                        label: Text(filt),

                        // for border color changing , we used 👇 [can be also used for width,style,strokeAlign]
                        side:BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1)
                        ),
                      
                        // border radii 👇
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                      
                        labelStyle: TextStyle(fontSize: 16),
                        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                        // backgroundColor: Color.fromRGBO(245, 247, 249, 1),
                        elevation: 9.0,
                      ),
                    ),
                  );
              }),
            )
            
          ],
          
        ),
      ),
    );
  }
}
