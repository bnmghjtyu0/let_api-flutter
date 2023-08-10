// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:let_api_flutter/src/ui/screens/widget_demo/widgets/demo_custom_title.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_datepicker/custom_datepicker.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_datepicker/custom_datepicker_validator.dart';

// ignore: constant_identifier_names
enum SingingCharacter { Richard, Angel }

enum SampleItem { itemOne, itemTwo, itemThree }

class WidgetDemoScreen extends StatefulWidget {
  const WidgetDemoScreen({Key? key}) : super(key: key);

  @override
  State<WidgetDemoScreen> createState() => WidgetDemoScreenState();
}

class WidgetDemoScreenState extends State<WidgetDemoScreen> {
  List<Tab> tabs = <Tab>[
    Tab(text: 'Zeroth'),
    Tab(text: 'First'),
    Tab(text: 'Second'),
  ];
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Row(children: [
              Spacer(),
              PopupMenuButton<SampleItem>(
                initialValue: selectedMenu,
                // Callback that sets the selected popup menu item.
                onSelected: (SampleItem item) {
                  setState(() {
                    selectedMenu = item;
                  });
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<SampleItem>>[
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemOne,
                    child: Text('Item 1'),
                  ),
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemTwo,
                    child: Text('Item 2'),
                  ),
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemThree,
                    child: Text('Item 3'),
                  ),
                ],
              ),
            ]),
            bottom: TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: const [
              _Tab1(),
              Text('123'),
              Text('123'),
            ],
          ),
        );
      }),
    );
  }
}

class _Tab1 extends StatefulWidget {
  const _Tab1({Key? key}) : super(key: key);

  @override
  State<_Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<_Tab1> {
  List<bool> checked = [true, false];
  //註冊頁表單
  final FormGroup form = FormGroup({
    'birthday':
        FormControl<String>(value: '', validators: [BirthdayValidator()]),
  });

  SingingCharacter? _character = SingingCharacter.Richard;

  void radioHandler(SingingCharacter? value) {
    setState(() {
      _character = value;
    });
  }

  void checkHandler(bool? value, i) {
    setState(() {
      if (value != null) {
        checked[i] = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(children: [
          DemoCustomTitle(
            title: 'Text',
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('titleLarge', style: Theme.of(context).textTheme.titleLarge),
              Text('titleMedium',
                  style: Theme.of(context).textTheme.titleMedium),
              Text('titleSmall', style: Theme.of(context).textTheme.titleSmall),
              RichText(
                  text: TextSpan(
                      text: 'google',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.blue,
                          decoration: TextDecoration.underline))),
            ],
          ),
          DemoCustomTitle(title: 'Button'),
          Column(
            children: [
              Row(
                children: [
                  TextButton(
                    child: const Text('Text Button'),
                    onPressed: () {},
                  ),
                  TextButton(
                    onPressed: null,
                    child: const Text('Text Button disabled'),
                  ),
                ],
              ),
              Row(
                children: [
                  OutlinedButton(
                    child: const Text('Outlined Button'),
                    onPressed: () {},
                  ),
                  OutlinedButton(
                    onPressed: null,
                    child: const Text('Outlined Button disabled'),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    child: const Text('Elevated Button'),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: const Text('disabled'),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.email),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          DemoCustomTitle(
            title: 'avatar 大頭貼',
          ),
          Row(
            children: const [
              CircleAvatar(
                foregroundImage: NetworkImage(
                    "https://cdn2.ettoday.net/images/3353/3353619.jpg"),
                maxRadius: 30,
                minRadius: 30,
              )
            ],
          ),
          DemoCustomTitle(
            title: 'Checkbox',
          ),
          Row(
            children: [
              for (var i = 0; i < 2; i++)
                Row(
                  children: [
                    Checkbox(
                        onChanged: (value) => checkHandler(value, i),
                        tristate: i == 1,
                        value: checked[i],
                        checkColor: Colors.white,
                        shape:
                            RoundedRectangleBorder(), //RoundedRectangleBorder, CircleBorder
                        activeColor: Theme.of(context).primaryColor),
                    GestureDetector(
                      child: Text('Checkbox ${i + 1}',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      onTap: () {
                        checkHandler(!checked[i], i);
                      },
                    )
                  ],
                ),
              Checkbox(
                  onChanged: null,
                  value: false,
                  checkColor: Colors.white,
                  shape:
                      RoundedRectangleBorder(), //RoundedRectangleBorder, CircleBorder
                  activeColor: Theme.of(context).primaryColor),
              Text('disabled',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ],
          ),
          DemoCustomTitle(
            title: 'Radio',
          ),
          Row(children: <Widget>[
            Radio<SingingCharacter>(
              value: SingingCharacter.Richard,
              groupValue: _character,
              onChanged: radioHandler,
            ),
            GestureDetector(
              child: Text('Richard'),
              onTap: () {
                radioHandler(SingingCharacter.Richard);
              },
            ),
            Radio<SingingCharacter>(
              value: SingingCharacter.Angel,
              groupValue: _character,
              onChanged: radioHandler,
            ),
            GestureDetector(
              child: Text('Angel'),
              onTap: () {
                radioHandler(SingingCharacter.Angel);
              },
            ),
          ]),
          DemoCustomTitle(
            title: 'Text fields',
          ),
          Column(
            children: [
              TextFormField(
                initialValue: '',
                decoration: InputDecoration(
                  labelText: '帳號',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: '123',
                decoration: InputDecoration(
                  labelText: '密碼',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                enabled: false,
                initialValue: '',
                decoration: InputDecoration(
                  labelText: 'input disabled',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomDatepicker(
                  formControl: form.controls['birthday'],
                  hintText: '請輸入西元年月日(例如：1990/01/01)',

                  ///迄日
                  firstDate: DateTime(DateTime.now().year - 100,
                      DateTime.now().month, DateTime.now().day - 1),

                  ///起日
                  lastDate: DateTime(DateTime.now().year - 18,
                      DateTime.now().month, DateTime.now().day - 1))
            ],
          ),
          DemoCustomTitle(title: 'Chip 熱門搜尋的標籤'),
          Row(
            children: [
              InputChip(
                label: Text('綜藝大熱門'),
                onSelected: (bool value) {
                  // print(value);
                },
              ),
              InputChip(
                label: Text('綜藝玩很大'),
                onSelected: (bool value) {},
              ),
              InputChip(
                label: Text('峮峮'),
                onDeleted: () {},
              )
            ],
          ),
          Row(
            children: const [
              ChoiceChip(
                label: Text('花花'),
                selected: true,
              ),
              ChoiceChip(
                label: Text('Choice Chip'),
                selected: false,
              ),
            ],
          ),
          Row(
            children: [
              FilterChip(
                label: Text('Filter Chip'),
                selected: true,
                onSelected: (bool value) {},
              ),
              FilterChip(
                label: Text('Filter Chip'),
                onSelected: (bool value) {},
              ),
            ],
          ),
          DemoCustomTitle(title: 'Alert Dialog'),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    showDialog<void>(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Reset settings?'),
                              content: Text(
                                  'This will reset your device to its default factory settings.'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('CANCEL'),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('ACCEPT'),
                                ),
                              ],
                            ));
                  },
                  child: Text('Alert Dialog'))
            ],
          )
        ]),
      ),
    );
  }
}
