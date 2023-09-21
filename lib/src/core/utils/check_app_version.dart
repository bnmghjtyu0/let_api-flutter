// Package imports:
import 'package:firebase_remote_config/firebase_remote_config.dart';
// Project imports:
import 'package:let_api_flutter/common_libs.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

Future checkAppVersion() async {
  debugPrint('checkAppVersion');
  //步驟 1：取得裝置資訊
  final info = await PackageInfo.fromPlatform();

  //步驟 2：取得遠端設定單例對象
  final config = FirebaseRemoteConfig.instance;
  config.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1)));

  // 第 3 步：獲取並啟動值
  await config.fetchAndActivate();

  // 手機 App 版本
  final currentVersion = Version.parse(info.version);
  // Firebase Remote Config 參數值 app_version
  final latestVersion = Version.parse(config.getString('app_version'));
  // Firebase Remote Config 參數值 app_url
  var appUrl = config.getString('app_url');

  print('currentVersion: $currentVersion');
  print('latestVersion: $latestVersion');

  //如果小於最新版本，跳出更新提示視窗
  if (currentVersion < latestVersion) {
    print('目前版本小於最新版本');
  }
}
