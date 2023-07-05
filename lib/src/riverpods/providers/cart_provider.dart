import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:let_api_flutter/src/riverpods/notifiers/cart_notifier.dart';
import 'package:let_api_flutter/src/riverpods/states/cart_state.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, CartState>((ref) => CartNotifier());
