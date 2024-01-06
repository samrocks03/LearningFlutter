// product_list.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/product_details_page.dart';

class ProductList extends StatefulWidget {

  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filter = const ['All','Adidas','Nike','Bata'];
  late String filterSelector;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    filterSelector = filter[0];
  }

    final border = const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomRight: Radius.circular(40)));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: GoogleFonts.aBeeZee(
                      textStyle: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: const Icon(Icons.search),
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
                        side:const BorderSide(
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
            ),

            Expanded(
              // height: 100,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context,index){
                  final product = products[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context){
                            return ProductDetailsPage(product: product);
                          }
                        )
                      );
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'].toString(),
                      bgColor: index.isEven 
                                  ? Color.fromRGBO(216, 240, 253, 1) 
                                  : Colors.black12,
                    ),
                  );
                }),
            )
              
          ],
          
        ),
      );
  }
}