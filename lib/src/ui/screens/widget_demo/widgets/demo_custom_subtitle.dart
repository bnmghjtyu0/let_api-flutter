// Flutter imports:
import 'package:flutter/material.dart';

class DemoCustomSubTitle extends StatelessWidget {
  final String title;
  const DemoCustomSubTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Align(
          alignment: Alignment.centerLeft,
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold))),
      SizedBox(
        height: 20,
      ),
    ]);
  }
}
