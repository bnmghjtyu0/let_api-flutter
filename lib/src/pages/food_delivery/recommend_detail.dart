import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/pages/food_delivery/widgets/expandable_text.dart';
import 'package:let_api_flutter/src/utils/colors.dart';
import 'package:let_api_flutter/src/utils/dimensions.dart';
import 'package:let_api_flutter/src/widgets/app-icon.dart';
import 'package:let_api_flutter/src/widgets/big-text.dart';

class RecommendDetailWidget extends StatefulWidget {
  const RecommendDetailWidget({Key? key}) : super(key: key);

  @override
  _RecommendDetailWidgetState createState() => _RecommendDetailWidgetState();
}

class _RecommendDetailWidgetState extends State<RecommendDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.clear),
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
                          size: Dimensions.font26, text: 'Sliver app bar'))),
            ),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            //上方區塊高度
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/image/lake.jpg",
                    width: double.maxFinite, fit: BoxFit.cover)),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: ExpandableTextWidget(
                    text:
                        'Taiwanese cuisine is a delightful and diverse culinary tradition that showcases the island\'s rich cultural heritage and influences from various regions, including China, Japan, and Southeast Asia. Taiwanese food is known for its bold flavors, vibrant colors, and the use of fresh, locally sourced ingredients. Here are some popular Taiwanese dishes that are loved both locally and internationally: Beef Noodle Soup (牛肉麵): Considered Taiwan\'s national dish, this hearty soup features tender braised beef, rich broth infused with aromatic spices, and chewy wheat noodles. It\'s often garnished with green onions, pickled vegetables, and chili oil for an extra kick. Bubble Tea (珍珠奶茶): Also known as boba tea, this globally beloved drink originated in Taiwan. It consists of a sweet milk tea base mixed with chewy tapioca pearls. It comes in a variety of flavors and can be served hot or cold. Gua Bao (割包): A popular Taiwanese street food, Gua Bao is a steamed bun filled with tender, braised pork belly, pickled mustard greens, crushed peanuts, and cilantro. It offers a perfect balance of savory, sweet, and tangy flavors.Taiwanese cuisine is a delightful and diverse culinary tradition that showcases the island\'s rich cultural heritage and influences from various regions, including China, Japan, and Southeast Asia. Taiwanese food is known for its bold flavors, vibrant colors, and the use of fresh, locally sourced ingredients. Here are some popular Taiwanese dishes that are loved both locally and internationally: Beef Noodle Soup (牛肉麵): Considered Taiwan\'s national dish, this hearty soup features tender braised beef, rich broth infused with aromatic spices, and chewy wheat noodles. It\'s often garnished with green onions, pickled vegetables, and chili oil for an extra kick. Bubble Tea (珍珠奶茶): Also known as boba tea, this globally beloved drink originated in Taiwan. It consists of a sweet milk tea base mixed with chewy tapioca pearls. It comes in a variety of flavors and can be served hot or cold. Gua Bao (割包): A popular Taiwanese street food, Gua Bao is a steamed bun filled with tender, braised pork belly, pickled mustard greens, crushed peanuts, and cilantro. It offers a perfect balance of savory, sweet, and tangy flavors.'),
              )
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
                  child:
                      BigText(text: '\$10 + Add to cart', color: Colors.white),
                )
              ],
            ))
      ]),
    );
  }
}
