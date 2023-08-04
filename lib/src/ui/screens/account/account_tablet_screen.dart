import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/ui/common/widgets/app_header.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';

class AccountTabletScreen extends StatelessWidget {
  AccountTabletScreen({Key? key, required this.users}) : super(key: key);

  List<dynamic> users;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: $styles.colors.gray01,
        child: Column(
          children: [
            AppHeader(
              title: 'Profile',
              backgroundColor: $styles.colors.mainColor,
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  margin: EdgeInsets.only(
                      left: Dimensions.height(60),
                      right: Dimensions.height(60)),
                  width: Dimensions.avatarSm(),
                  height: Dimensions.avatarSm(),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.avatarSm() / 2),
                      color: Colors.blue,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/lake.jpg'))),
                ),
                Expanded(
                  child: Wrap(
                    spacing: 32, //水平
                    runSpacing: 10, //垂直
                    children: [
                      for (var i = 0; i < users.length; i++)
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 100,
                          margin:
                              EdgeInsets.only(bottom: Dimensions.height(20)),
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.height(20)),
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              offset: const Offset(0, 2),
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                            )
                          ]),
                          child: Row(children: [
                            AppIcon(
                              icon: users[i]['icon'],
                              iconSize: Dimensions.height(20),
                              color: Colors.white,
                              backgroundColor: users[i]['iconBackground'],
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: Dimensions.width(20)),
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.height(20)),
                              child: Text(users[i]['name']),
                            )
                          ]),
                        )
                    ],
                  ),
                )
              ],
            )),
          ],
        ));
  }
}
