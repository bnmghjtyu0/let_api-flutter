import 'package:let_api_flutter/common_libs.dart';

class MlHeader extends StatelessWidget {
  const MlHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          $styles.svg.menu,
          SizedBox(
            width: 20,
          ),
          Flexible(
              child: TextField(
            decoration: InputDecoration(
              prefixIcon: IconButton(onPressed: null, icon: $styles.svg.search),
              hintText: '',
              filled: true,
              fillColor: Colors.grey.shade200,
              isDense: true,
              contentPadding:
                  EdgeInsets.only(left: 8, right: 18, top: 8, bottom: 8),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(6),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          )),
          SizedBox(
            width: 10,
          ),
          IconButton(
            icon: $styles.svg.radio,
            onPressed: () {
              print('123');
            },
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            child: $styles.svg.apps,
            onTap: () {
              print('123');
            },
          ),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 30,
            width: 30,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              foregroundImage: NetworkImage(
                  "https://cdn2.ettoday.net/images/3353/3353619.jpg"),
              maxRadius: 15,
              minRadius: 15,
            ),
          )
        ],
      ),
    );
  }
}
