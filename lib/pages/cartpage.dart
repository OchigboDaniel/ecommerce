import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/carttile.dart';
import '../components/productmodel.dart';
import '../product_lists/edeyhotlist.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override


  Widget build(BuildContext context) {
    return Consumer<EdeyhotProductList>(
      builder: (context, product, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Total: ' + product.getUserCartAmount() + ' NGN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey[700]
            ),),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      Product cart = product.getUserCart()[index];
                      return CartTile(cartTile: cart, 
                        );
                    },
                    separatorBuilder: (context, index) => SizedBox( height: 10),
                    itemCount: product.userCart.length))
          ],
        ),
      ),
    );
  }
}
