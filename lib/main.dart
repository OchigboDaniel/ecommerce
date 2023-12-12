import 'package:ecommerce/components/colors.dart';
import 'package:ecommerce/pages/cartpage.dart';
import 'package:ecommerce/pages/homepage.dart';
import 'package:ecommerce/product_lists/edeyhotlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  void main(){
    runApp(const MYApp());
  }
  
  class MYApp extends StatefulWidget {
    const MYApp({super.key});

  @override
  State<MYApp> createState() => _MYAppState();
}

class _MYAppState extends State<MYApp> {
    void selectPage(int index){
      setState(() {
        _pageIndex = index;
      });
    }

    int _pageIndex = 0;

    List pages = [
      HomePage(),
      Cartpage()
    ];

    MyColors appColors = MyColors();



    @override
    Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => EdeyhotProductList())
        ],
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,

          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              title: Center(
                child: Text('My Cart',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey[700]
                  ),),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Icon(Icons.shopping_bag, size: 30,),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 2, 92, 99),
                          shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Consumer<EdeyhotProductList>(
                            builder: (context, cartProduct, child) =>
                                Text(cartProduct.userCart.length.toString(), style: TextStyle(
                              fontSize: 12,
                                color: Colors.white),),
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.grey[800],
                selectedItemColor: Color.fromARGB(200, 2, 92, 99),
                currentIndex: _pageIndex,
                onTap: selectPage,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home),
                      label:  "Home"),
                  BottomNavigationBarItem(

                      icon: Icon(Icons.shopping_bag_rounded),
                      label: "Cart")
                ]
            ),
            drawer: Drawer(
              backgroundColor: Colors.grey[800],
              child: Column(
                children: [
                  DrawerHeader(child: Padding(
                      padding: EdgeInsets.all(20),
                  child: Image.asset("lib/images/logo.jpg",),),),
                ],
              ),
            ),
            body: pages[_pageIndex],
          ),
        ),
      );
    }
}


