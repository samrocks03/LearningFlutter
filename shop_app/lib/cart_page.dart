// ignore_for_file: prefer_const_constructors
// cart_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    // final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Cart')),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context,index){
          final cartItem = cart[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 25,
            ),
            

            trailing: IconButton(
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text(
                        "Delete Item",
                        style: Theme.of(context).textTheme.titleMedium
                      ),

                      content: Text(
                        "Are you sure, you want to delete this item?",
                      style: Theme.of(context).textTheme.bodySmall
                      ),

                      actions: [
                        TextButton(
                          onPressed: (){
                            context
                              .read<CartProvider>()
                              .removeProduct(cartItem);
                            
                            // Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                            Navigator.of(context).pop();

                            // here, can use `Navigator.pop() instead of
                            //Navigator.of(context).pop(); 

                            // since we don't have nested Navigators, hence will achieve same result
                          }, 
                          child: Text("Yes",
                            style: GoogleFonts.zeyada(
                              color: Colors.red.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 25
                            ),
                          )
                        ),

                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          }, 
                          child: Text("No",
                            style: GoogleFonts.zeyada(
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 25
                            ),
                          )
                        ),
                      ],
                    );
                  });
              },
              icon: Icon(
                Icons.delete_sweep_sharp,
                color: Colors.red.shade700,
                size: 30),
            ),

            
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),

            subtitle: Text(
              'Size: ${cartItem['size']}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue.shade800),
            ),  
          );
        }
      )
    );
  }
}