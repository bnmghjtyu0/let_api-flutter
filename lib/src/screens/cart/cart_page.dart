import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/controllers/cart_controller.dart';
import 'package:let_api_flutter/src/screens/food_delivery/food_delivery.dart';
import 'package:let_api_flutter/src/utils/colors.dart';
import 'package:let_api_flutter/src/utils/constants.dart';
import 'package:let_api_flutter/src/utils/dimensions.dart';
import 'package:let_api_flutter/src/widgets/app-icon.dart';
import 'package:let_api_flutter/src/widgets/big-text.dart';
import 'package:let_api_flutter/src/widgets/small-text%20copy.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => MainFoodPage());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  )
                ],
              )),
          Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: MediaQuery.removePadding(
                  context: context,
                  child: Container(
                    margin: EdgeInsets.only(top: Dimensions.height15),
                    child:
                        GetBuilder<CartController>(builder: (cartController) {
                      return ListView.builder(
                        itemCount: cartController.getItems.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                              width: double.maxFinite,
                              height: Dimensions.height20 * 5,
                              child: Row(children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.height10),
                                    width: Dimensions.height20 * 5,
                                    height: Dimensions.height20 * 5,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstants.BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    cartController
                                                        .getItems[index].img!)),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20),
                                        color: Colors.white)),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                Expanded(
                                    child: SizedBox(
                                        height: Dimensions.height20 * 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                                text: cartController
                                                    .getItems[index].name!,
                                                color: Colors.black54),
                                            SmallText(text: 'spicy'),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                    text: cartController
                                                        .getItems[index].price
                                                        .toString(),
                                                    color: Colors.redAccent),
                                                // 計數器 + 0 -
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        top:
                                                            Dimensions.height10,
                                                        bottom:
                                                            Dimensions.height10,
                                                        left:
                                                            Dimensions.width20,
                                                        right:
                                                            Dimensions.width20),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: (() {
                                                            // popularProduct
                                                            //     .setQuantity(
                                                            //         false);
                                                          }),
                                                          child: Icon(
                                                              Icons.remove,
                                                              color: AppColors
                                                                  .signColor),
                                                        ),
                                                        SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2),
                                                        BigText(text: ''
                                                            // popularProduct
                                                            //     .inCartItems
                                                            //     .toString()
                                                            ),
                                                        SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2),
                                                        GestureDetector(
                                                          onTap: (() {
                                                            // popularProduct
                                                            //     .setQuantity(
                                                            //         true);
                                                          }),
                                                          child: Icon(Icons.add,
                                                              color: AppColors
                                                                  .signColor),
                                                        )
                                                      ],
                                                    ))
                                              ],
                                            )
                                          ],
                                        )))
                              ]));
                        },
                      );
                    }),
                  )))
        ],
      ),
    );
  }
}
