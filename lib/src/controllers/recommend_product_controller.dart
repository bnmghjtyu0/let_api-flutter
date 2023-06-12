import 'package:get/get.dart';
import 'package:let_api_flutter/src/services/repository/recommend_product_repo.dart';
import 'package:let_api_flutter/src/models/products_model.dart';

class RecommendProductController extends GetxController {
  final RecommendProductRepo recommendProductRepo;

  //建構子
  RecommendProductController({required this.recommendProductRepo});
  List<dynamic> _recommendProductList = [];
  List<dynamic> get recommendProductList => _recommendProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendProductList() async {
    Response response = await recommendProductRepo.getRecommendProductList();

    if (response.statusCode == 200) {
      print("got products");
      _recommendProductList = [];
      _recommendProductList.addAll(Product.fromJson(response.body).products);

      print(_recommendProductList);
      _isLoaded = true;
      update();
    } else {}
  }
}
