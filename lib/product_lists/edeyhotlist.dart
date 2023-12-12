import 'package:flutter/material.dart';
import '../components/productmodel.dart';



class EdeyhotProductList extends ChangeNotifier{

  List<Product> edeyhotList = [
    Product(name: "Jump Suit",
        imgLink: "lib/images/jumpsuit1.jpg",
        price: 3000,
        description: "Royal blue jumpsuit"),
    Product(name: "Jump Suit",
        imgLink: "lib/images/playsuit1.jpg",
        price: 3000,
        description: "Royal blue jumpsuit"),
  ];

  List<Product> userCart = [

  ];

  List<Product> getUserCart(){
    return userCart;
  }

   String getUserCartAmount(){
     int amount = 0;
      for (int i = 0; i < userCart.length; i++){

       amount += userCart[i].price;
      }
      return amount.toString();
  }

  List<Product> getProduct(){
    return edeyhotList;
  }

  void addProductToCart(Product product){
    userCart.add(product);
    notifyListeners();
  }

  void deleteProductFromCart(Product product){
    userCart.remove(product);
    notifyListeners();
  }


}