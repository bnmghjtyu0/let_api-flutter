import 'dart:convert';

import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/core/constants/shared_preference_constant.dart';
import 'package:let_api_flutter/src/core/models/cart_model.dart';
import 'package:let_api_flutter/src/core/models/products_model.dart';
import 'package:let_api_flutter/src/core/riverpods/providers/shared_preference_provider.dart';
import 'package:let_api_flutter/src/core/riverpods/states/cart_state.dart';

///購物車 reducer
class CartNotifier extends StateNotifier<CartState> {
  final Ref ref;

  Map<int, dynamic> tempData = {};

  /// 暫存 local storage 的資料
  List<CartModel> storageItems = [];
  List<String> cart = [];
  List<String> cartHistory = [];

  // 取得目前購物車數量
  int get totalItems {
    var totalQuantity = 0;
    state.data.forEach((key, value) {
      totalQuantity += value.quantity;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return state.data.entries.map((e) {
      return e.value;
    }).toList();
  }

  //計算總金額
  num get totalAmount {
    num total = 0;
    state.data.forEach((key, value) {
      total += value.quantity * value.price;
    });
    return total;
  }

  // 初始值
  CartNotifier(this.ref)
      : super(CartState(data: {}, quantity: 0, totalItems: 0));

  //新增與更新
  void add(dynamic product, int quantity) {
    var totalQuantity = 0;

    Map<int, CartModel> tempData = {};
    tempData.addAll(state.data);

    if (tempData.containsKey(product.id)) {
      tempData.update(product.id!, (value) {
        totalQuantity = value.quantity + quantity;
        return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: totalQuantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product);
      });

      if (totalQuantity <= 0) {
        tempData.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        tempData.putIfAbsent(product.id, () {
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
    }

    var itemsList = tempData.entries.map((e) {
      return e.value;
    }).toList();
    //儲存到 localStorage
    addToCartList(itemsList);

    state = state.copyWith(
        quantity: quantity, data: tempData, totalItems: tempData.length);
  }

  bool existInCart(ProductModel product) {
    if (state.data.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (state.data.containsKey(product.id)) {
      state.data.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity;
        }
      });
    }
    return quantity;
  }

  //檢查計數器數字 > 0 或小於 20
  int? checkQuantify(BuildContext context, inCartItems, int quantity) {
    if ((inCartItems + quantity) < 1) {
      // Yay! 數字不能小於 1!
      final snackBar = SnackBar(content: Text("商品數量不能小於 1"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return null;
    } else if ((inCartItems + quantity) > 20) {
      // Yay! 數字不能大於 20 拉!
      final snackBar = SnackBar(content: Text("商品數量不能大於 20"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return null;
    } else {
      return quantity;
    }
  }

  //sharedPreferences 新增資料
  void addToCartList(List<CartModel> cartList) async {
    //重置資料(注意這裡不是定義新的變數，而是清空外層的 cart)
    cart = [];

    // convert object to string because sharePreferences only accepts string
    cartList.forEach((element) {
      cart.add(jsonEncode(element));
    });

    final sharedPreference = await ref.read(sharedPreferenceProvider.future);

    sharedPreference.setStringList(SharedPreferenceConstants.CART_LIST, cart);
  }

  //sharedPreferences 取得資料
  Future<List<CartModel>> getCartList() async {
    List<String> carts = [];

    final sharedPreference = await ref.read(sharedPreferenceProvider.future);
    //如果 localStorage 有資料
    if (sharedPreference.containsKey(SharedPreferenceConstants.CART_LIST)) {
      carts =
          sharedPreference.getStringList(SharedPreferenceConstants.CART_LIST)!;
    }

    List<CartModel> cartList = [];

    //convert string to object array
    carts.forEach((cart) {
      cartList.add(CartModel.fromJson(jsonDecode(cart)));
    });

    return cartList;
  }

  //取得購物車全部資料 - 初始化載入一次
  void getCartData() async {
    List<CartModel> cartList = await getCartList();
    setCart(cartList);
  }

  // 設定購物車全部資料
  void setCart(List<CartModel> items) {
    Map<int, CartModel> tempData = {};
    storageItems = items;

    storageItems.forEach((cart) {
      tempData.putIfAbsent(cart.id, () => cart);
    });

    state = state.copyWith(data: tempData);
  }

  //加入歷史清單與移除購物車清單
  void addToCartHistory() async {
    final sharedPreference = await ref.read(sharedPreferenceProvider.future);

    if (sharedPreference.containsKey(SharedPreferenceConstants.CART_HISTORY)) {
      cartHistory = sharedPreference
          .getStringList(SharedPreferenceConstants.CART_HISTORY)!;
    }

    //結帳後，設定結帳時間
    for (int i = 0; i < cart.length; i++) {
      String tempData = cart[i];
      CartModel tempCart = CartModel.fromJson(jsonDecode(cart[i]));

      //設定結帳時間
      tempCart = CartModel(
          id: tempCart.id,
          name: tempCart.name,
          price: tempCart.price,
          img: tempCart.img,
          quantity: tempCart.quantity,
          isExist: tempCart.isExist,
          time: DateTime.now().toString(),
          product: tempCart.product);

      String tempCartString = jsonEncode(tempCart);

      cartHistory.add(tempCartString);
    }

    sharedPreference.setStringList(
        SharedPreferenceConstants.CART_HISTORY, cartHistory);
  }

  Future<List<CartModel>> getCartHistoryList() async {
    final sharedPreference = await ref.read(sharedPreferenceProvider.future);
    if (sharedPreference.containsKey(SharedPreferenceConstants.CART_HISTORY)) {
      cartHistory = [];
      cartHistory = sharedPreference
          .getStringList(SharedPreferenceConstants.CART_HISTORY)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));

    List<CartModel> cartHistoryReversed = List.from(cartListHistory.reversed);
    return cartListHistory;
  }

//清空購物車的資料
  void removeCart() async {
    //清空 RiverPod 的資料
    state = state.copyWith(data: {}, quantity: 0, totalItems: 0);

    //清空 local storage 的資料
    final sharedPreference = await ref.read(sharedPreferenceProvider.future);
    sharedPreference.remove(SharedPreferenceConstants.CART_LIST);
  }
}
