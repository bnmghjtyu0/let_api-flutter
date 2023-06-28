import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/core/riverpods/notifiers/app_notifier.dart';

///全域共用
final appProvider = Provider.family<AppNotifier, BuildContext>(
    (ref, context) => AppNotifier(context: context));
