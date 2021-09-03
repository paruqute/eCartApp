import 'package:flutter/material.dart';
import 'package:online_gadgets/provider/cart_provider.dart';
import 'package:online_gadgets/screens/bottom_tab.dart';
import 'package:online_gadgets/screens/cart.dart';
import 'package:online_gadgets/screens/product_detail/product_details.dart';

import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),

        routes: {
          '/':(context)=>BottomNavBar(),
          '/product_detail':(context)=>ProductDetail(),
          '/my_cart':(context)=>Cart(),
        },
      ),
    );
  }
}

