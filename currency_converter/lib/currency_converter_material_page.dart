// ignore_for_file: prefer_const_constructors, prefer_const_declarations, avoid_print, use_key_in_widget_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class CurrencyConverterMaterialPage extends StatefulWidget{
    CurrencyConverterMaterialPage({super.key}){
    print("Constructor");
  }
  
  @override
  // ignore: no_logic_in_create_state
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage>{
  final TextEditingController textEditingController = TextEditingController();
  double res = 0;

  @override
  Widget build(BuildContext context) {
    // return const Scaffold();
    print("rebuilt");
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
      appBar : AppBar(
        backgroundColor: Color.fromARGB(255, 28, 20, 20),
        title: Row(
          
          children: const [
            Icon(Icons.attach_money_outlined,
                  color: Colors.amber,
                ),
            Text(
              "Currency Converter",
              style: TextStyle(
                color: Colors.amber
                ),
              ),
            ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              // color: Colors.black,
              child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  [
                    Text("₹ ${res != 0 ? res.toStringAsFixed(3) : res.toStringAsFixed(0)}",
                    style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF74B9FF), // Changed text color to black
                  ),
                )
              ],
                ),
            ),
            SizedBox(height: 20),

            TextField(
              controller: textEditingController,
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
          /*
                        style: ButtonStyle(

                          // Playing with size 
                          // If u keep minimumSize with height : double.minPositive -> it'll only take the size of the widget it's containing
                                                    //   width : double.infinity -> it'll take the entire width from left -> right
                          //  if we go with maxSize : It'll cover up only those widget's space
          /*                minimumSize: MaterialStatePropertyAll(
                              Size(double.infinity,
                              double.minPositive),
                            ),
          */              elevation: MaterialStatePropertyAll(15),
                          surfaceTintColor : MaterialStatePropertyAll(Colors.white),
                          splashFactory :InkSplash.splashFactory ,
                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 92, 169, 246)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.tealAccent),
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            // color: Colors.white, //This color property can't be used, u need to use `foregroundColor`
                            )),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(
                                color: Color(0xFF74B9FF),
                                width: 2,
                                style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
          */
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Color(0xFF74B9FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                
              )  

              ,onPressed: (){
                  res = double.parse(textEditingController.text)*81;
                setState(() {
                  // print(res);
                });
                // debugPrint("I'm pressed"); //debugPrint returns only a string rather than an object{returned by print statement} 
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




// -----------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------
class CurrencyConverterMaterialPagee extends StatelessWidget {
  const CurrencyConverterMaterialPagee({super.key});

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
      appBar : AppBar(
        backgroundColor: Color.fromARGB(255, 28, 20, 20),
        title: Row(
          
          children: const [
            Icon(Icons.attach_money_outlined,
                  color: Colors.amber,
                ),
            Text("Currency Converter",
              style: TextStyle(
                color: Colors.amber
                ),
              ),
            ],
        ),
      ),
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
          /*
                        style: ButtonStyle(

                          // Playing with size 
                          // If u keep minimumSize with height : double.minPositive -> it'll only take the size of the widget it's containing
                                                    //   width : double.infinity -> it'll take the entire width from left -> right
                          //  if we go with maxSize : It'll cover up only those widget's space
          /*                minimumSize: MaterialStatePropertyAll(
                              Size(double.infinity,
                              double.minPositive),
                            ),
          */              elevation: MaterialStatePropertyAll(15),
                          surfaceTintColor : MaterialStatePropertyAll(Colors.white),
                          splashFactory :InkSplash.splashFactory ,
                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 92, 169, 246)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.tealAccent),
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            // color: Colors.white, //This color property can't be used, u need to use `foregroundColor`
                            )),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(
                                color: Color(0xFF74B9FF),
                                width: 2,
                                style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
          */
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
