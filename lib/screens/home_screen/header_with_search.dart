

import 'package:flutter/material.dart';


import '../../Constraints.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
     this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
     // margin: const EdgeInsets.only(bottom: kDefaultPadding * 2.5),

      height: size.height * 0.20,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: size.height * 0.5 - 27,
            decoration: const BoxDecoration(
              color: primaryColor,
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(36),
              //   bottomRight: Radius.circular(36),
              // ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Gadgets',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(onPressed: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoriteList()));
                  },
                      icon: const Icon(Icons.favorite_rounded,color: Colors.white,)),

                  // IconButton(onPressed: (){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                  // },
                  //     icon: Icon(Icons.shopping_cart,color: Colors.white,))
                  //Spacer(),
                  //Image.asset("assets/images/logo.png")
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: primaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        enabled: false,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          // surffix isn't working properly  with SVG
                          // thats why we use row
                          // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}