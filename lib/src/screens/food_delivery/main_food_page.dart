import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/utils/colors.dart';
import 'package:let_api_flutter/src/core/utils/dimensions.dart';
import 'package:let_api_flutter/src/core/widgets/big-text.dart';
import 'package:let_api_flutter/src/core/widgets/small-text%20copy.dart';
import 'package:let_api_flutter/src/screens/food_delivery/widgets/content.dart';

class MainFoodPage extends ConsumerStatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends ConsumerState<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // header
        Container(
            child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions(context).height(45),
                    bottom: Dimensions(context).height(15)),
                padding: EdgeInsets.only(
                    left: Dimensions(context).width(20),
                    right: Dimensions(context).width(20)),
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
                      width: Dimensions(context).height(45),
                      height: Dimensions(context).height(45),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              Dimensions(context).radius(15)),
                          color: AppColors.mainColor),
                      child: Icon(Icons.search,
                          color: Colors.white,
                          size: Dimensions(context).iconSize(24)),
                    ))
                  ],
                ))),

        //body
        //SingleChildScrollView 可滾動
        Expanded(child: SingleChildScrollView(child: FoodDeliveryContent()))
      ],
    );
  }
}
