import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/ui/screens/mlhome/mlheader.dart';

class Mlhome extends StatefulWidget {
  const Mlhome({Key? key}) : super(key: key);

  @override
  State<Mlhome> createState() => MlhomeState();
}

class MlhomeState extends State<Mlhome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        MlHeader(),

        //media player
        Container(height: 200, color: Colors.grey.shade200),

        SizedBox(
          height: 10,
        ),
        // info
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Column(children: [
            Row(
              children: [Text('好康報報', style: $styles.text.h3)],
            ),
            Row(
              children: const [Text('123')],
            )
          ]),
        ),

        //列表
        Expanded(
          child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: <Widget>[
                      for (int i = 0; i < 16; i++)
                        Column(
                          children: [
                            ListTile(
                              leading: Container(
                                width: 160 / 1.5,
                                height: 90 / 1.5,
                                color: Colors.grey.shade400,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8.0),
                              title: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                      '野原廣志爽吃助餐  $i')),
                              subtitle: Row(children: [
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
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                    child: Text(
                                  'Supporting text Supporting text Supporting text Supporting text Supporting text Supporting text',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: $styles.colors.mlgrey200),
                                  maxLines: 2,
                                ))
                              ]),
                              onTap: () {
                                print('爽吃自助餐');
                              },
                            ),
                          ],
                        )
                    ],
                  ))),
        )
      ],
    ));
  }
}
