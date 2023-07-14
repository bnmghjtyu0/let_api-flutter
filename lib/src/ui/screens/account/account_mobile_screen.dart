import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/constants/constants.dart';
import 'package:let_api_flutter/src/ui/common/widgets/app_header.dart';
import 'package:let_api_flutter/src/ui/common/widgets/widgets.dart';

class AccountMobileScreen extends StatelessWidget {
  AccountMobileScreen({Key? key, required this.users}) : super(key: key);

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
            Container(
              margin: EdgeInsets.only(top: Dimensions(context).height(20), bottom: Dimensions(context).height(20)),
              width: Dimensions(context).avatarXs(),
              height: Dimensions(context).avatarXs(),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions(context).avatarXs() / 2),
                  color: Colors.blue,
                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/lake.jpg'))),
            ),
            Column(
              children: [
                for (var i = 0; i < users.length; i++)
                  Container(
                    margin: EdgeInsets.only(bottom: Dimensions(context).height(20)),
                    padding: EdgeInsets.symmetric(horizontal: Dimensions(context).height(20)),
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
                        iconSize: Dimensions(context).height(20),
                        color: Colors.white,
                        backgroundColor: users[i]['iconBackground'],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: Dimensions(context).width(20)),
                        padding: EdgeInsets.symmetric(vertical: Dimensions(context).height(20)),
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
