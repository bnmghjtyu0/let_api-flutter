import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/pages/food-delivery/content.dart';
import 'package:let_api_flutter/src/utils/colors.dart';
import 'package:let_api_flutter/src/utils/dimensions.dart';
import 'package:let_api_flutter/src/widgets/big-text.dart';
import 'package:let_api_flutter/src/widgets/small-text%20copy.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("螢幕高度: ${MediaQuery.of(context).size.height}");
    print("螢幕高度: ${MediaQuery.of(context).size.width}");
    return Column(
      children: [
        // header
        Container(
            child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      BigText(
                          text: 'Food Delivery', color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(text: '一個美食外送平台'),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ]),
                    Center(
                        child: Container(
                      width: Dimensions.width45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor),
                      child: Icon(Icons.search, color: Colors.white),
                    ))
                  ],
                ))),

        //body
        FoodDeliveryContent()
      ],
    );
  }
}
