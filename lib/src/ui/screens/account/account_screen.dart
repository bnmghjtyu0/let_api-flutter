import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/ui/screens/account/account_mobile_screen.dart';
import 'package:let_api_flutter/src/ui/screens/account/account_tablet_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> users = [
      {"icon": Icons.person, "name": 'Ahmed', "iconBackground": $styles.colors.mainColor},
      {"icon": Icons.phone, "name": '13761849016', "iconBackground": $styles.colors.mainColor},
      {"icon": Icons.mail, "name": 'info@google.com.tw', "iconBackground": $styles.colors.mainColor},
      {"icon": Icons.location_on, "name": '台中市', "iconBackground": $styles.colors.mainColor},
      {"icon": Icons.message, "name": 'Welcome to Taichung', "iconBackground": $styles.colors.red},
    ];

    return LayoutBuilder(builder: (context, constraints) {
      //一般來說都會鎖橫屏，如果要做橫屏，也可以使用 LayoutBuilder
      if (constraints.maxWidth > 600) {
        return AccountTabletScreen(
          users: users,
        );
      }
      return AccountMobileScreen(
        users: users,
      );
    });
  }
}
