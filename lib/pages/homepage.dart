import 'package:ecommerce/components/productmodel.dart';
import 'package:ecommerce/pages/cartpage.dart';
import 'package:ecommerce/product_lists/edeyhotlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:provider/provider.dart';
import '../components/edeyhot.dart';
import '../components/selections.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Selections> selectionList = [

    Selections(
        imgPath: "lib/images/selections/blazers.jpg", productNam: "Blazers"),
    Selections(imgPath: "lib/images/selections/jumpsuits.jpg",
        productNam: "Jumpsuits"),
    Selections(imgPath: "lib/images/selections/pants.jpg", productNam: "Pants"),
    Selections(imgPath: "lib/images/selections/playsuit.jpg",
        productNam: "Play Suits"),
    Selections(
        imgPath: "lib/images/selections/shorts.jpg", productNam: "Shorts"),
    Selections(
        imgPath: "lib/images/selections/skirts.jpg", productNam: "Skirts"),
    Selections(imgPath: "lib/images/selections/tops.jpg", productNam: "Tops"),
    Selections(imgPath: "lib/images/selections/two piece.jpg",
        productNam: "Two Piece"),
  ];

  void addProductToCart(Product product){
    Provider.of<EdeyhotProductList>(context, listen: false).getUserCartAmount();
    Provider.of<EdeyhotProductList>(context, listen: false).addProductToCart(product);
  }
  

  @override
  Widget build(BuildContext context) {
    return Consumer<EdeyhotProductList>(
      builder: (context, productList, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200]
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                )
            ),
            Center(
              child: Text("Dealer of Thrift Okirica Clothes, Slay on a Budget",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700]
                ),),
            ),
            SizedBox(height: 10,),

            Row(
              children: [
                Text("Lagos, Nigeria",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade700
                  ),),
                const SizedBox(width: 5),
                Icon(Icons.location_on,
                  color: Colors.blue,)
              ],
            ),

            Container(
              height: 140,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: 10),
                        itemCount: selectionList.length,
                        itemBuilder: (context, index) {
                          return SelectionTile(
                              imgPath: selectionList[index].imgPath,
                              productNam: selectionList[index].productNam);
                        }),
                  )
              ),
            ),

            Text("As E Dey Hot, E Dey Burn ",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
              ),),

            Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                    Product edeyhotProduct = productList.getProduct()[index];
                      return EdeyhotTile(
                        edeyhotProduct: edeyhotProduct,
                        onTap: () => addProductToCart(edeyhotProduct));
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 10,),
                    itemCount: (productList.edeyhotList.length),),),
            Padding(padding: EdgeInsets.all(10),
              child: Divider(),),
          ],
        ),
      ),
    );
  }

}