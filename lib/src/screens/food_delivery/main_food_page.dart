import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/core/utils/colors.dart';
import 'package:let_api_flutter/src/core/utils/dimensions.dart';
import 'package:let_api_flutter/src/core/widgets/big-text.dart';
import 'package:let_api_flutter/src/core/widgets/small-text%20copy.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
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
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor),
                      child: Icon(Icons.search,
                          color: Colors.white, size: Dimensions.iconSize24),
                    ))
                  ],
                ))),

        //body
        //SingleChildScrollView 可滾動
        // Expanded(child: SingleChildScrollView(child: FoodDeliveryContent()))
      ],
    );
  }
}
