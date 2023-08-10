import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/core/constants/constants.dart';
import 'package:let_api_flutter/src/widgets/app_header.dart';
import 'package:let_api_flutter/src/widgets/widgets.dart';

class AccountMobileScreen extends StatelessWidget {
  const AccountMobileScreen({Key? key, required this.users}) : super(key: key);

  final List<dynamic> users;

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
            Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height(20), bottom: Dimensions.height(20)),
              width: Dimensions.avatarXs(),
              height: Dimensions.avatarXs(),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.avatarXs() / 2),
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/lake.jpg'))),
            ),
            Column(
              children: [
                for (var i = 0; i < users.length; i++)
                  Container(
                    margin: EdgeInsets.only(bottom: Dimensions.height(20)),
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.height(20)),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                        margin: EdgeInsets.only(left: Dimensions.width(20)),
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height(20)),
                        child: Text(users[i]['name']),
                      )
                    ]),
                  )
              ],
            )
          ],
        ));
  }
}
