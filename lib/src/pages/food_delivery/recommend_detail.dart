import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/controllers/recommend_product_controller.dart';
import 'package:let_api_flutter/src/pages/food_delivery/widgets/expandable_text.dart';
import 'package:let_api_flutter/src/routes/route_helper.dart';
import 'package:let_api_flutter/src/utils/colors.dart';
import 'package:let_api_flutter/src/utils/constants.dart';
import 'package:let_api_flutter/src/utils/dimensions.dart';
import 'package:let_api_flutter/src/widgets/app-icon.dart';
import 'package:let_api_flutter/src/widgets/big-text.dart';
import 'package:get/get.dart';

class RecommendDetailWidget extends StatelessWidget {
  final int pageId;

  const RecommendDetailWidget({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recommend =
        Get.find<RecommendProductController>().recommendProductList[pageId];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (() {
                      Get.toNamed(RouteHelper.getInitial());
                    }),
                    child: Icon(Icons.clear),
                  ),
                  Icon(Icons.shopping_cart_outlined)
                ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                  child: Center(
                      child: BigText(
                          size: Dimensions.font26, text: recommend.name))),
            ),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            //上方區塊高度
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                    AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        recommend.img!,
                    width: double.maxFinite,
                    fit: BoxFit.cover)),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(text: recommend.description))
            ],
          ))
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(
            left: Dimensions.width20 * 2.5,
            right: Dimensions.width20 * 2.5,
            top: Dimensions.height10,
            bottom: Dimensions.height10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                iconColor: Colors.white,
                icon: Icons.remove,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.iconSize24,
              ),
              BigText(
                text: "12.88 X 0",
                color: Colors.black,
                size: Dimensions.font26,
              ),
              AppIcon(
                iconColor: Colors.white,
                icon: Icons.add,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.iconSize24,
              )
            ],
          ),
        ),
        Container(
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
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.signColor,
                    )),
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
                      text: '\$ ${recommend.price} + Add to cart',
                      color: Colors.white),
                )
              ],
            ))
      ]),
    );
  }
}
