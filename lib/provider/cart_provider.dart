import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:online_gadgets/Model/cart_model.dart';
import 'package:online_gadgets/helper/prefshelper.dart';

import 'package:shared_preferences/shared_preferences.dart';


class CartProvider extends ChangeNotifier{
  List<CartModel> _cart = [];
  List<CartModel> get items{
    return _cart;
  }
  int get cartCount{
    return _cart.length;
  }


  int quantity (String id){

    for(int i=0;i<_cart.length;i++){
      if(_cart[i].id==id){
        return _cart[i].quantity;
      }
    }
    return 0;
  }


  void addToCart(CartModel item){
    if(_cart.length == 0 ){
      _cart.add(item);
    }else{
      if(item.quantity.toString() == "0"){
        deleteItem(item.id);
      }else{
        addItem(item);
      }
    }
    notifyListeners();
    PrefsHelper.saveCart(jsonEncode(_cart));
  }

  void deleteItem(String id) {
    for(int i=0;i<_cart.length;i++){
      if(_cart[i].id == id){
        _cart.removeAt(i);
      }
    }
    notifyListeners();
    PrefsHelper.saveCart(jsonEncode(_cart));
  }

  void addItem(CartModel item) {
    bool found = false;
    int index = 0;
    for(int i=0;i<_cart.length;i++){
      if(_cart[i].id == item.id){
        found = true;
        index = i;
      }
    }
    if(found){
      _cart[index].quantity = item.quantity;
    }else{
      _cart.add(item);
    }
  }
  double get total{
    double total = 0;
    for(int i=0;i<_cart.length;i++){
      total += (double.parse(_cart[i].price.toString()) * double.parse(_cart[i].quantity.toString()));
    }
    return total;
  }


  void addQuantity(String id){
    for(int i=0;i<_cart.length;i++){
      if(_cart[i].id == id){
        int quantity = int.parse(_cart[i].quantity.toString()) + 1;
        _cart[i].quantity = quantity ;
      }
    }
    notifyListeners();
    PrefsHelper.saveCart(jsonEncode(_cart));
  }

  void reduceQuantity(String id){

    for(int i=0;i<_cart.length;i++){
      if(_cart[i].id == id){
        int quantity = int.parse(_cart[i].quantity.toString()) - 1;
        if(quantity == 0){
          deleteItem(id);
        }else{
          _cart[i].quantity = quantity;
        }

      }
    }
    notifyListeners();
    PrefsHelper.saveCart(jsonEncode(_cart));
  }


}

