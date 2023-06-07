import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/data/repository/popular_product_repo.dart';
import 'package:let_api_flutter/src/models/products_model.dart';
import 'package:let_api_flutter/src/utils/colors.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  int _quantity = 0;
  int get quantity => _quantity;

  //建構子
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    print(response.body.toString());
    if (response.statusCode == 200) {
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);

      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantify(_quantity + 1);
    } else {
      _quantity = checkQuantify(_quantity - 1);
    }

    update();
  }

  //檢查計數器數字 > 0 或小於 20
  int checkQuantify(int quantity) {
    if (quantity < 0) {
      Get.snackbar("計數器", "最小值為 0 哦",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 0;
    } else if (quantity > 20) {
      Get.snackbar("計數器", "最大值為 20 哦",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  //重置
  void initProduct() {
    _quantity = 0;
  }
}
