import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/models/cart_model.dart';
import 'package:let_api_flutter/src/riverpods/providers/cart_provider.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';

// 觀看紀錄： https://youtu.be/GQJovou6zuE?t=15796
// 購買歷史紀錄頁面
class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  void init() async {
    //取得歷史清單
    List<CartModel> getCartHistoryList =
        await ref.read(cartProvider.notifier).getCartHistoryList();
    Map<String, int> cartItemsPerOrder = {};

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 100,
          color: $styles.colors.mainColor,
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigText(text: "Cart History", color: Colors.white),
              AppIcon(
                icon: Icons.shopping_cart_outlined,
                iconColor: $styles.colors.mainColor,
                backgroundColor: $styles.colors.white,
              ),
            ],
          ),
        ),
        Text('123'),
        Container(
          height: 500,
          margin: EdgeInsets.only(
            top: Dimensions(context).height(20),
            left: Dimensions(context).width(20),
            right: Dimensions(context).width(20),
          ),
          child: ListView(
            children: [for (int i = 0; i < 100; i++) Text('12123213')],
          ),
        )
      ],
    ));
  }
}
