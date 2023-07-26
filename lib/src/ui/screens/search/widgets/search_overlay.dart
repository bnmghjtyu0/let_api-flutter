import 'package:flutter/material.dart';

///搜尋頁的 overlay
class CustomOverlay<T extends Object> extends StatelessWidget {
  /// {@macro flutter.widgets.RawAutocomplete.optionsViewBuilder}
  final AutocompleteOptionsViewBuilder<T> optionsViewBuilder;

  const CustomOverlay({Key? key, required this.optionsViewBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Container(
          margin: EdgeInsets.only(top: 100),
          child: optionsViewBuilder(context));
    });
  }
}

/// The type of the [RawAutocomplete] callback which returns a [Widget] that
/// displays the specified [options] and calls [onSelected] if the user
/// selects an option.
typedef AutocompleteOptionsViewBuilder<T extends Object> = Widget Function(
  BuildContext context,
);
