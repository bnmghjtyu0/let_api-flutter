import 'package:get/get.dart';
import 'package:let_api_flutter/src/data/repository/cart_repo.dart';
import 'package:let_api_flutter/src/models/cart_model.dart';
import 'package:let_api_flutter/src/models/products_model.dart';

//購物車
class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  get items => _items;

  //新增與更新
  void addItem(ProductModel product, int quantity) {
    print('cart_controller: addItem');
    var totalQuantity = 0;

    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        print(value.quantity! + quantity);
        return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString());
      });

      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          print('adding item to the cart${product.id!} quantity$quantity}');
          _items.forEach((key, value) {
            print("quantity is ${value.quantity}");
          });
          return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString());
        });
      }
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

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }
}
