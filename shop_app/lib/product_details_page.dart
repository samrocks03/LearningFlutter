// ignore_for_file: prefer_const_constructors
// product_details_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';


class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  // late String val;
  final List<int> sizeOfShoes = [8,9,10,11,12,13]; 
  late int selector = 0;

  
  @override
  void initState() {
    super.initState();
    selector = 0;
  }

  // this is onTap function for "Add to Cart Functionality"
  // the State<T> class gives us access to the `context` accessed in the onTap() func
  void onTap(){
    if(selector != 0){
      Provider.of<CartProvider>(context,listen: false)
        .addProduct({
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          "size": selector,
        });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product of size $selector added successfully!',
          style: TextStyle(fontSize: 11),),
        ),
      );

    }else{
      ScaffoldMessenger
        .of(context)
        .showSnackBar(
          SnackBar(
            content: Text("Please Select Size!!",
          style: TextStyle(fontSize: 11)) 
          )
        );
    }    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details",style: TextStyle(color: Colors.blue.shade900),)
      ),

      body: Column(
        children: [
          Text(widget.product['title'] as String),
          Spacer(),
          Image.asset(widget.product['imageUrl'] as String),
          Spacer(flex: 2),

          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.horizontal(left: Radius.circular(62.5), right: Radius.circular(62.5))
            ),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("\$ ${widget.product['price']}"),
              SizedBox(height: 10,),

              SizedBox(
                height: 55,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (widget.product['sizes'] as List<int>).length,

                  itemBuilder: (context,index){
                    final size = (widget.product['sizes'] as List<int>)[index];
                    
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selector = size;
                          });
                        },
                        child: Chip(
                        backgroundColor: selector == size
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).secondaryHeaderColor,

                          label: Text(size.toString()),    
                          
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: Size(double.infinity, 50)
                  ),
                  child: Text(
                    "Add To Cart",
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                    )
                  ),
              )
            ]),
          )

        ],
      ),
    );
  }
}