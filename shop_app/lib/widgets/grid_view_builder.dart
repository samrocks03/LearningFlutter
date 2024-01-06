import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/pages/product_details_page.dart';
import 'package:shop_app/widgets/product_card.dart';

import '../global_variables.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints)
      {
      return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2
                    ),
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
                                    ? const Color.fromRGBO(216, 240, 253, 1) 
                                    : Colors.black12,
                      ),
                    );
                  },
                );
              }
    );
  }
}