import 'package:flutter/material.dart';
import 'package:online_gadgets/provider/cart_provider.dart';

import 'package:provider/provider.dart';

import '../constraints.dart';
class Cart extends StatelessWidget {
  const Cart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          title:  Text(
            "My Cart",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            icon:Icon(Icons.arrow_back,color: Colors.white,size: 25,),
          onPressed: ()=>Navigator.pop(context),
          ),
        ),
        body:cart.cartCount>0? Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: 500,
                child: ListView.builder(
                  itemCount: cart.cartCount,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 180,
                       width: 400,
                       margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 3,
                                  color: Colors.grey,
                                ),
                              ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 120,
                                  width: 100,
                                  color: Colors.white,
                                  child: Image.network('https://omanphone.smsoman.com/pub/media/catalog/product/${cart.items[index].image}',fit: BoxFit.contain,),
                                )
                              ],
                            ),
                            SizedBox(width: 5,),
                            Container(
                              width: 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cart.items[index].name,
                                    textAlign: TextAlign.justify,
                                    softWrap: true,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    "OMR "+((cart.items[index]
                                        .price) *
                                        (cart.items[index].quantity)).toString(),
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 100,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                Provider.of<CartProvider>(context,listen: false).reduceQuantity(cart.items[index].id);
                                              },
                                              child: Container(
                                                height: 25.0,
                                                width: 25.0,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(7.0),
                                                  color: Colors.grey.shade300,



                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.black,
                                                    size: 15.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(cart.items[index].quantity.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 17.0)),
                                            InkWell(
                                              onTap: () {
                                                Provider.of<CartProvider>(context,listen: false).addQuantity(cart.items[index].id);
                                              },
                                              child: Container(
                                                height: 25.0,
                                                width: 25.0,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(7.0),
                                                  color: Colors.grey.shade300,

                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.black,

                                                    size: 15.0,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      IconButton(icon: Icon(Icons.delete,color: Colors.grey,),
                                          onPressed:(){
                                            Provider.of<CartProvider>(context,listen: false).deleteItem(cart.items[index].id);
                                          } )
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SubTotal ("+cart.cartCount.toString()+" items):  ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),),
                    Text("OMR "+ cart.total.toString(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryColor
                      ),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(height: 40,
              width: 210,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                    onPressed: (){}, 
                    child: Text("Proceed to pay",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0)
                    )),
              )
            ],
          )
        ):Container(
          margin: EdgeInsets.all(20),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //   Container(
              //     height: 300,
              //     //width: 300,
              // decoration: BoxDecoration(
              //     color: Colors.white,
              //     // image: new DecorationImage(
              //     //   image: new AssetImage("assets/images/cartEmpty.png"),
              //     //   fit: BoxFit.cover,)
              //   ),
              //     child: Image.asset("assets/images/cartempty.png"),
              //   ),
              Center(child: Icon(Icons.add_shopping_cart,size: 64,color:primaryColor,)),
              SizedBox(height: 20,),
              Center(child: Container(child: Text("YOUR CART IS EMPTY",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,letterSpacing: 1.5 ),))),
              SizedBox(height: 20,),
              Center(child: Container(child: SizedBox( width:200,child: Text("Looks like you haven't cart your product yet",textAlign: TextAlign.center, style: TextStyle(color: Colors.black45),)),),),
              SizedBox(height: 20,),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        primary: primaryColor
                    ),
                    onPressed : (){
                      Navigator.pushNamed(context, '/');
                    },

                    child: Text("BROWSE PRODUCTS",
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w600,
                          fontSize: 18

                      ),)),
              )
            ],
          ),
        ),
      );
    },);
  }
}
