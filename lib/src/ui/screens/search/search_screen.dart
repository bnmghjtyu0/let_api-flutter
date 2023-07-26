import 'package:flutter/scheduler.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/ui/screens/search/widgets/search_overlay.dart';
import 'package:let_api_flutter/src/ui/screens/search/widgets/search_view.dart';
import 'package:let_api_flutter/src/utils/debouncer.dart';
part 'widgets/search_input.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  Function(String value) myMethod = (value) => {};
  void _handleSearchSubmitted(String query) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(slivers: [
        SliverAppBar(
            expandedHeight: 80,
            collapsedHeight: 80,
            pinned: true,
            backgroundColor: $styles.colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
              ),
              title: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                ))),
                child: _SearchInput(
                  onSubmit: _handleSearchSubmitted,
                  builder: (BuildContext context,
                      Function(String value) updateInputValue) {
                    myMethod = updateInputValue;
                  },
                ),
              ),
            )),
        SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Text('熱門搜尋'),
              SizedBox(height: 10),
              _Suggestion(myMethod: myMethod),
            ])))
      ]),
    );
  }
}

class _Suggestion extends StatelessWidget {
  List<String> suggestList = ['sweet', 'c'];
  Function(String value) myMethod;
  _Suggestion({Key? key, required this.myMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        for (int i = 0; i < suggestList.length; i++)
          ElevatedButton(
              onPressed: () {
                myMethod(suggestList[i]);
              },
              child: Text(suggestList[i]))
      ],
    ));
  }
}
