import 'package:flutter/material.dart';

import '../Model/ProductModel.dart';
class CartProvider extends ChangeNotifier{
  final Map<int,int> _quantities={};
  final Map<int,Productmodel> _item={};

  Map<int,Productmodel> get items => _item;
  Map<int,int>get quantities => _quantities;

  void addToCart(Productmodel product){ {
    if(_item.containsKey(product.id)){
      _quantities[product.id] = _quantities[product.id]! + 1;
    }else{
      _item[product.id] = product;
      _quantities[product.id] = 1;
    }
    notifyListeners();  
  }
  }

   void increaseQty(int id) {
    _quantities[id] = _quantities[id]! + 1;
    notifyListeners();
  }

  void decreaseQty(int id) {
   if(quantities[id]==1){
    remove(id);
   }else{
     _quantities[id] = _quantities[id]! - 1;
   
   }
     notifyListeners();
  }
  
  void remove(int id) {
    _quantities.remove(id);
    _item.remove(id);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    _quantities.forEach((key, value) {
      total += _item[key]!.price! * value;
    });
    return total;
  }

  
}