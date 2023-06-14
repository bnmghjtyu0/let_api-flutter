//購物車 repo
import 'dart:convert';

import 'package:let_api_flutter/src/core/models/cart_model.dart';
import 'package:let_api_flutter/src/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  //sharedPreferences 新增資料
  void addToCartList(List<CartModel> cartList) {
    print('addToCartList');
    List<String> cart = [];
    for (var element in cartList) {
      cart.add(jsonEncode(element));
    }

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
  }

  //sharedPreferences 取得資料
  List<CartModel> getCartList() {
    List<String> carts = [];

    //如果 localStorage 有資料
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }

    List<CartModel> cartList = [];

    for (var element in carts) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }
    return cartList;
  }
}
