import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'productmodel.dart';
import '../product_lists/edeyhotlist.dart';

class CartTile extends StatefulWidget {
  CartTile({super.key,
    required this.cartTile});
  Product cartTile;
  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  void deleteCart(){
    Provider.of<EdeyhotProductList>(context as BuildContext, listen: false)
        .deleteProductFromCart(widget.cartTile);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        trailing: IconButton(onPressed: deleteCart, icon: Icon(Icons.delete),),
        leading: Image.asset(widget.cartTile.imgLink),
        title: Text(widget.cartTile.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[700]
          ),
        ),
        subtitle: Text(widget.cartTile.price.toString() + " NGN"),
      ),
    );
  }
}
