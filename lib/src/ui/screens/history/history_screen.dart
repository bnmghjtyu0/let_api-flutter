import 'package:intl/intl.dart';
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
  //日期當 key，取得對應的資料
  Map<String, int> cartItemsPerOrder = {};

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //取得歷史清單
    List<CartModel> getCartHistoryList =
        await ref.read(cartProvider.notifier).getCartHistoryList();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      String time = DateFormat('yyyy-MM-dd HH:mm:ss')
          .parse(getCartHistoryList[i].time!)
          .toString();
      if (cartItemsPerOrder.containsKey(time)) {
        cartItemsPerOrder.update(time, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(time, () => 1);
      }
    }

    setState(() {
      cartItemsPerOrder = cartItemsPerOrder;
    });
  }

  List<int> getOrderTimeToList() {
    return cartItemsPerOrder.entries.map((data) => data.value).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<int> itemsPreOrder = getOrderTimeToList();
    var listCounter = 0;

    // build render function
    // --------
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
                color: $styles.colors.mainColor,
                backgroundColor: $styles.colors.white,
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
                margin: EdgeInsets.only(
                  top: Dimensions(context).height(20),
                  left: Dimensions(context).width(20),
                  right: Dimensions(context).width(20),
                ),
                child: ListView(children: [
                  for (int i = 0; i < itemsPreOrder.length; i++)
                    Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: FutureBuilder(
                              future: ref
                                  .read(cartProvider.notifier)
                                  .getCartHistoryList(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<CartModel>> snapshot) {
                                //購物車歷史紀錄列表
                                List<CartModel> cartHistoryList =
                                    snapshot.data!;
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      (() {
                                        var time = cartHistoryList[i].time;
                                        DateTime parseDate =
                                            DateFormat("yyyy-MM-dd HH:mm:ss")
                                                .parse(time!);
                                        var inputDate = DateTime.parse(
                                            parseDate.toString());
                                        var outputFormat =
                                            DateFormat("MM/dd/yyyy hh:mm a");
                                        var outputDate =
                                            outputFormat.format(inputDate);
                                        return Text(outputDate);
                                      }()),
                                      SizedBox(
                                          height:
                                              Dimensions(context).height(10)),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Wrap(
                                                direction: Axis.horizontal,
                                                children: List.generate(
                                                    itemsPreOrder[i], (index) {
                                                  if (listCounter <
                                                      cartHistoryList.length) {
                                                    listCounter++;
                                                  }
                                                  //圖片最多放三張
                                                  return index <= 2
                                                      ? Container(
                                                          height: 80,
                                                          width: 80,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .circular(Dimensions(
                                                                          context)
                                                                      .radius(
                                                                          15 /
                                                                              2)),
                                                              image: DecorationImage(
                                                                  image: NetworkImage(ApiConstants
                                                                          .BASE_URL +
                                                                      ApiConstants
                                                                          .UPLOAD_URL +
                                                                      cartHistoryList[listCounter -
                                                                              1]
                                                                          .img))),
                                                        )
                                                      : Container();
                                                })),
                                            SizedBox(
                                              height: 80,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('Total'),
                                                  Text(
                                                    '${itemsPreOrder[i]} Items',
                                                    style: TextStyle(
                                                        color: $styles
                                                            .colors.black),
                                                  ),
                                                  Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            Dimensions(context)
                                                                .height(10),
                                                        vertical:
                                                            Dimensions(context)
                                                                .height(10 / 2),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  Dimensions(context)
                                                                      .radius(
                                                                          15)),
                                                          border: Border.all(
                                                              width: 1,
                                                              color: $styles
                                                                  .colors
                                                                  .mainColor)),
                                                      child: Text('one more',
                                                          style: TextStyle(
                                                              color: $styles
                                                                  .colors
                                                                  .mainColor)))
                                                ],
                                              ),
                                            )
                                          ])
                                    ]);
                              }),
                        ))
                ])))
      ],
    ));
  }
}
