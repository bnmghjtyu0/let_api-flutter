import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/pages/food_delivery/widgets/expandable_text.dart';
import 'package:let_api_flutter/src/pages/food_delivery/widgets/info_column.dart';
import 'package:let_api_flutter/src/utils/colors.dart';
import 'package:let_api_flutter/src/utils/dimensions.dart';
import 'package:let_api_flutter/src/widgets/app-icon.dart';
import 'package:let_api_flutter/src/widgets/big-text.dart';

class PopularDetail extends StatelessWidget {
  const PopularDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        image: AssetImage(('assets/image/lake.jpg')))),
              )),

          //icons
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
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
                      InfoColumn(title: 'Taiwan'),
                      SizedBox(height: Dimensions.height20),
                      // Introduce
                      BigText(text: 'Introduce'),
                      // expandable text
                      Expanded(
                          child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                          text:
                              'Taiwanese cuisine is a delightful and diverse culinary tradition that showcases the island\'s rich cultural heritage and influences from various regions, including China, Japan, and Southeast Asia. Taiwanese food is known for its bold flavors, vibrant colors, and the use of fresh, locally sourced ingredients. Here are some popular Taiwanese dishes that are loved both locally and internationally: Beef Noodle Soup (牛肉麵): Considered Taiwan\'s national dish, this hearty soup features tender braised beef, rich broth infused with aromatic spices, and chewy wheat noodles. It\'s often garnished with green onions, pickled vegetables, and chili oil for an extra kick. Bubble Tea (珍珠奶茶): Also known as boba tea, this globally beloved drink originated in Taiwan. It consists of a sweet milk tea base mixed with chewy tapioca pearls. It comes in a variety of flavors and can be served hot or cold. Gua Bao (割包): A popular Taiwanese street food, Gua Bao is a steamed bun filled with tender, braised pork belly, pickled mustard greens, crushed peanuts, and cilantro. It offers a perfect balance of savory, sweet, and tangy flavors.',
                        ),
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
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                child: BigText(text: '\$10 + Add to cart', color: Colors.white),
              )
            ],
          )),
    );
  }
}
