import 'package:ecommerce/components/productmodel.dart';
import 'package:flutter/material.dart';

class EdeyhotTile extends StatelessWidget {
  EdeyhotTile({super.key,
    required this.edeyhotProduct,
    required this.onTap
    });

  Product edeyhotProduct;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      margin: EdgeInsets.only(left: 10, top: 10),
      decoration: BoxDecoration(
        color:  Colors.white,
        borderRadius:  BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(edeyhotProduct.imgLink))
            ),
          ),

          // product discription
          Center(
            child: Text(edeyhotProduct.description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600]
            ),),
          ),


          // Product name and price and Add icon
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Text(edeyhotProduct.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:  Colors.grey[700],
                        fontSize: 14
                      ),),
                    Text(edeyhotProduct.price.toString() + " NGN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:  Colors.grey[700],
                          fontSize: 14
                      ),)
                  ],
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)
                  )
                ),
                child: GestureDetector(
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.add, color: Colors.white, size: 30,)),
                ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
