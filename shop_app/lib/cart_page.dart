// ignore_for_file: prefer_const_constructors
// cart_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(Provider.of<String>(context));
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
              onPressed: (){},
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