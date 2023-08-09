import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/ui/screens/widget_demo/widgets/demo_custom_title.dart';

enum SingingCharacter { Richard, Angel }

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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: const [
              _tab1(),
              Text('123'),
              Text('123'),
            ],
          ),
        );
      }),
    );
  }
}

class _tab1 extends StatefulWidget {
  const _tab1({Key? key}) : super(key: key);

  @override
  State<_tab1> createState() => _tab1State();
}

class _tab1State extends State<_tab1> {
  List<bool> checked = [true, false];

  SingingCharacter? _character = SingingCharacter.Richard;

  radioHandler(SingingCharacter? value) {
    setState(() {
      _character = value;
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
          Row(
            children: [
              ElevatedButton(
                child: const Text('Button label'),
                onPressed: () {},
              ),
              ElevatedButton(
                onPressed: null,
                child: const Text('disabled'),
              ),
            ],
          ),
          DemoCustomTitle(
            title: 'Checkbox',
          ),
          Row(
            children: [
              for (var i = 0; i < 2; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null) {
                              checked[i] = value;
                            }
                          });
                        },
                        tristate: i == 1,
                        value: checked[i],
                        checkColor: Colors.white,
                        shape:
                            RoundedRectangleBorder(), //RoundedRectangleBorder, CircleBorder
                        activeColor: Theme.of(context).primaryColor),
                    Text('Checkbox ${i + 1}',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
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
            Text('Richard'),
            Radio<SingingCharacter>(
              value: SingingCharacter.Angel,
              groupValue: _character,
              onChanged: radioHandler,
            ),
            Text('Angel')
          ]),
          DemoCustomTitle(
            title: 'Text fields',
          ),
          Column(
            children: [
              TextFormField(
                initialValue: '',
                decoration: InputDecoration(
                  labelText: 'Label text',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: '',
                decoration: InputDecoration(
                  labelText: 'Label text',
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
            ],
          ),
          DemoCustomTitle(title: 'Chip'),
          Row(
            children: [
              InputChip(
                label: Text('Input Chip'),
                onSelected: null,
              ),
              InputChip(
                label: Text('Input Chip'),
                onSelected: (bool value) {},
              ),
              InputChip(
                label: Text('Input Chip'),
                onSelected: (bool value) {},
              ),
            ],
          ),
          Row(
            children: const [
              ChoiceChip(
                label: Text('Choice Chip'),
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
        ]),
      ),
    );
  }
}
