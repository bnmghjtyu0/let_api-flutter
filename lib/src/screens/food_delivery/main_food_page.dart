import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/constants/constants.dart';
import 'package:let_api_flutter/src/core/widgets/widgets.dart';
import 'package:let_api_flutter/src/screens/food_delivery/widgets/widgets.dart';

class MainFoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      Dimensions dimensions = Dimensions(context);
      return Column(
        children: [
          // header
          Container(
              child: Container(
                  margin: EdgeInsets.only(
                      top: dimensions.height(45),
                      bottom: dimensions.height(15)),
                  padding: EdgeInsets.only(
                      left: dimensions.width(20), right: dimensions.width(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        BigText(
                            text: 'Food Delivery', color: AppColors.mainColor),
                        Row(
                          children: [
                            SmallText(
                              text: '一個美食外送平台',
                            ),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        ),
                      ]),
                      Center(
                          child: Container(
                        width: dimensions.height(45),
                        height: dimensions.height(45),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(dimensions.radius(15)),
                            color: AppColors.mainColor),
                        child: Icon(Icons.search,
                            color: Colors.white, size: dimensions.iconSize(24)),
                      ))
                    ],
                  ))),

          //body
          //SingleChildScrollView 可滾動
          Expanded(child: SingleChildScrollView(child: FoodDeliveryContent()))
        ],
      );
    });
  }
}
