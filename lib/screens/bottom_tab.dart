
import 'package:flutter/material.dart';
import 'package:online_gadgets/screens/search.dart';



import '../constraints.dart';
import 'cart.dart';
import 'category.dart';
import 'home_screen/home_page.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex=0;


  List Pages=[const MyHomePage(), const Search(), Category(),const Cart()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.shifting,
          fixedColor: primaryColor,

        currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex=index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              //backgroundColor: Colors.green,
                icon:Icon(Icons.home_filled,color: primaryColor,),
                label: "Home",


            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.search,color: primaryColor,) ,
              label: "Search",
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.category,color: primaryColor,),
                label: "Category"
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.shopping_cart,color: primaryColor,) ,
                label: "Cart"
            ),

          ],
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,

        ),

      ),
    );
  }
}
