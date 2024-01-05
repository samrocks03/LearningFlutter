// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/cart_page.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/product_details_page.dart';
import 'package:shop_app/product_list.dart';

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
  int currentPage = 0;

  List<Widget> pages = [
    ProductList(),
    CartPage()
  ];

  @override
  void initState() {
    super.initState();
    filterSelector = filter[0];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
        //children should always be at last in the widget
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex : currentPage,
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home_outlined)
          ),

          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.shopping_cart_outlined)
          ),


        ],
      ),
    );
  }
}
