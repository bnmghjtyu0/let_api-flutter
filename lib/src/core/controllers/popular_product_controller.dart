import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/core/controllers/cart_controller.dart';
import 'package:let_api_flutter/src/core/models/cart_model.dart';
import 'package:let_api_flutter/src/core/models/products_model.dart';
import 'package:let_api_flutter/src/core/constants/colors.dart';

class PopularProductController {
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;
  int get totalItems {
    return _cart.totalItems;
  }

  late CartController _cart;

  //建構子
  PopularProductController();
  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantify(_quantity + 1);
    } else {
      _quantity = checkQuantify(_quantity - 1);
    }
    print(_quantity);
  }

  //檢查計數器數字 > 0 或小於 20
  int checkQuantify(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("計數器", "最小值為 0 哦",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 0;
    } else if ((inCartItems + quantity) > 20) {
      Get.snackbar("計數器", "最大值為 20 哦",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  //重置
  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);

    print('exist or not$exist');
    if (exist) {
      _inCartItems = cart.getQuantity(product);
    }
    print("the quantity in the cart is$_inCartItems");
  }

  void addItem(ProductModel product) {
    print('popular_product: addItem');
    _cart.addItem(product, _quantity);
    _quantity = 0;

    _inCartItems = _cart.getQuantity(product);
    print('popular_product: _inCartItems $_inCartItems');

    _cart.items.forEach((key, value) {
      print('the id is ' +
          value.id.toString() +
          "the quantity is " +
          value.quantity.toString());
    });
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
