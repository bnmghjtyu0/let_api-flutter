import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/controllers/popular_product_controller.dart';
import 'package:let_api_flutter/src/pages/food_delivery/food_delivery.dart';
import 'package:let_api_flutter/src/pages/food_delivery/widgets/expandable_text.dart';
import 'package:let_api_flutter/src/pages/food_delivery/widgets/info_column.dart';
import 'package:let_api_flutter/src/utils/colors.dart';
import 'package:let_api_flutter/src/utils/constants.dart';
import 'package:let_api_flutter/src/utils/dimensions.dart';
import 'package:let_api_flutter/src/widgets/app-icon.dart';
import 'package:let_api_flutter/src/widgets/big-text.dart';
import 'package:get/get.dart';

class PopularDetail extends StatelessWidget {
  final int pageId;
  const PopularDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    print('page is id $pageId');
    print('product name ' + product.name);
    return Scaffold(
      body: Stack(
        children: [
          //大圖
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                //double.maxFinite: 最大值
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage((AppConstants.BASE_URL +
                            AppConstants.UPLOAD_URL +
                            product.img!)))),
              )),

          //icons
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (() {
                      Get.to(() => MainFoodPage());
                    }),
                    child: AppIcon(icon: Icons.arrow_back_ios),
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoColumn(title: product.name!),
                      SizedBox(height: Dimensions.height20),
                      // Introduce
                      BigText(text: 'Introduce'),
                      // expandable text
                      Expanded(
                          child: SingleChildScrollView(
                        child: ExpandableTextWidget(text: product.description!),
                      ))
                    ],
                  ))),
        ],
      ),
      bottomNavigationBar: Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.height20,
              right: Dimensions.height20),
          decoration: BoxDecoration(
              color: AppColors.bottomBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 計數器 + 0 -
              Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(Icons.remove, color: AppColors.signColor),
                      SizedBox(width: Dimensions.width10 / 2),
                      BigText(text: '0'),
                      SizedBox(width: Dimensions.width10 / 2),
                      Icon(Icons.add, color: AppColors.signColor)
                    ],
                  )),

              // price + Add to cart
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                child: BigText(
                    text: '\$ ${product.price!} + Add to cart',
                    color: Colors.white),
              )
            ],
          )),
    );
  }
}
