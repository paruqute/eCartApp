import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:online_gadgets/Model/homeProductModel.dart';
import 'package:online_gadgets/screens/product_detail/product_details.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../constraints.dart';


class FeaturedItem extends StatefulWidget {
  const FeaturedItem({Key key}) : super(key: key);

  @override
  _FeaturedItemState createState() => _FeaturedItemState();
}

class _FeaturedItemState extends State<FeaturedItem> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HomeProductModel>>(
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return snapshot.data != null
            ?
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     mainAxisSpacing: 10.0,
          //     crossAxisSpacing: 10.0,
          //     childAspectRatio: 0.70),
          itemCount: snapshot.data[2].data.items.length,
          itemBuilder: (context, index) {
            var items = snapshot.data[2].data.items[index];
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/product_detail', arguments: new ProductArguments(
                    id: items.id,
                    image:items.image,
                    name: items.name,
                    preorder: items.preorder,
                    price: items.price,
                    productTag: items.productTag,
                    rating: items.rating,
                    sku: items.sku,
                    specialPrice: items.specialPrice,
                    storage: items.storage
                ));
              },
              child: Container(
                // margin: EdgeInsets.all(10),
                height: 200,
                //padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 3,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [

                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 10),
                          child: Container(
                            //margin: EdgeInsets.only(left:45,top: 20),
                            height: 140,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://omanphone.smsoman.com/pub/media/catalog/product/${items
                                          .image}'),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        // Divider(
                        //   color: primaryColor.withOpacity(0.4),
                        // ),
                        SizedBox(
                          height: 5,
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            height: 20,
                            width: 50,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  topLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                )
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  items.storage,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 160, left: 10),
                          child: Center(
                            child: Text(
                              items.name,
                              softWrap: true,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: Center(
                            child: Text(
                              "OMR: " + items.price.toString(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )


            : Container(
          color: Colors.lightBlueAccent,
        );
      },
      future: _fetchData(),
    );
  }
  Future<List<HomeProductModel>> _fetchData() async {
    final response =
    await http.get(Uri.parse('http://omanphone.smsoman.com/api/homepage'));
    return homeProductModelFromJson(response.body);
  }
}
