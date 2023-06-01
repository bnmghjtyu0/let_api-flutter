import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/pages/food-delivery/content.dart';
import 'package:let_api_flutter/src/utils/colors.dart';
import 'package:let_api_flutter/src/widgets/big-text.dart';
import 'package:let_api_flutter/src/widgets/small-text%20copy.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // header
        Container(
            child: Container(
                margin: EdgeInsets.only(top: 45, bottom: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
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
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
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
