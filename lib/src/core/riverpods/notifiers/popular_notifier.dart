// The StateNotifier class that will be passed to our StateNotifierProvider.
// This class should not expose state outside of its "state" property, which means
// no public getters/properties!
// The public methods on this class will be what allow the UI to modify the state.
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/models/cart_model.dart';
import 'package:let_api_flutter/src/core/models/products_model.dart';
import 'package:let_api_flutter/src/core/riverpods/states/popular_state.dart';

class PopularNotifier extends StateNotifier<PopularState> {
  // state 初始值
  PopularNotifier() : super(PopularState(data: {}, quantity: 0, totalItems: 0));

  //新增與更新
  void add(ProductModel product, int quantity) {
    print('add');
    print('product:${product.id}');

    print(state.data);

    state.data.forEach((key, value) {
      print('the id is ${value.id.toString()}');
      print('the quantity is ${value.quantity.toString()}');
    });

    var totalQuantity = 0;

    if (state.data.containsKey(product.id)) {
      state.data.update(product.id!, (value) {
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
        state.data.remove(product.id);
      }
    } else {
      print('沒資料');
      print(quantity);
      if (quantity > 0) {
        state.data.putIfAbsent(product.id!, () {
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

    state = state.copyWith(quantity: quantity, totalItems: totalQuantity);
    print(state.totalItems);
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

  List<CartModel> get getList {
    return state.data.entries.map((e) {
      return e.value;
    }).toList();
  }
}
