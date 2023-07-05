import 'dart:convert';

import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/models/cart_model.dart';
import 'package:let_api_flutter/src/models/products_model.dart';
import 'package:let_api_flutter/src/riverpods/states/cart_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

///購物車 reducer
class CartNotifier extends StateNotifier<CartState> {
  final SharedPreferences? sharedPreferences;

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  /// only for storage and shared_preference
  List<CartModel> storageItems = [];
  List<String> cart = [];

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  // //購物車總金額
  int get totalAmount {
    int total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  CartNotifier({this.sharedPreferences})
      : super(CartState(data: {}, quantity: 0, totalItems: 0));

  //新增與更新
  void add(dynamic product, int quantity) {
    print('add');
    print('product:${product.id}');

    state.data.forEach((key, value) {
      print('the id is ${value.id.toString()}');
      print('the quantity is ${value.quantity.toString()}');
    });

    var totalQuantity = 0;
    Map<int, dynamic> tempData = {};

    if (tempData.containsKey(product.id)) {
      tempData.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product);
      });

      if (totalQuantity <= 0) {
        tempData.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        print('購物車加入一筆資料, productId: ${product.id}');
        tempData.putIfAbsent(product.id!, () {
          return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: product);
        });
      }

      state = state.copyWith(
          quantity: quantity, data: tempData, totalItems: tempData.length);
    }
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  //取得購物車全部資料 - 初始化載入一次
  List<CartModel> getCartData() {
    // setCart = cartRepo.getCartList();
    return storageItems;
  }

  //setter, getter 設定購物車全部資料
  set setCart(List<CartModel> items) {
    storageItems = items;

    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  //sharedPreferences 新增資料
  void addToCartList(List<CartModel> cartList) {
    print('addToCartList');
    List<String> cart = [];
    for (var element in cartList) {
      cart.add(jsonEncode(element));
    }

    sharedPreferences!.setStringList(ApiConstants.CART_LIST, cart);
  }

  //sharedPreferences 取得資料
  List<CartModel> getCartList() {
    List<String> carts = [];

    //如果 localStorage 有資料
    if (sharedPreferences!.containsKey(ApiConstants.CART_LIST)) {
      carts = sharedPreferences!.getStringList(ApiConstants.CART_LIST)!;
    }

    List<CartModel> cartList = [];

    for (var element in carts) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }
    return cartList;
  }

  //檢查計數器數字 > 0 或小於 20
  int checkQuantify(context, inCartItems, int quantity) {
    if ((inCartItems + quantity) < 0) {
      // Yay! 數字不能小於 0!
      final snackBar = SnackBar(content: Text("Yay! 數字不能小於 0"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return 0;
    } else if ((inCartItems + quantity) > 20) {
      // Yay! 數字不能大於 20 拉!
      final snackBar = SnackBar(content: Text("Yay! 數字不能大於 20 拉!"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return 20;
    } else {
      return quantity;
    }
  }

  List<dynamic> get getList {
    return state.data.entries.map((e) {
      return e.value;
    }).toList();
  }
}
