part of '../home.dart';

// Search suggestions (11)
List<String> _searchSuggestions = const [
  'sweet',
  'nutritious',
  'cane',
  'hole',
  'vibrated',
  'aerophone',
  'blow',
  'fan',
  'flute',
  'bamboo',
  'lip',
];

class _SearchInput extends StatelessWidget {
  const _SearchInput({Key? key, required this.onSubmit, required this.wonder})
      : super(key: key);
  final void Function(String) onSubmit;
  final List<ProductModel> wonder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => Center(
        child: Autocomplete<String>(
          displayStringForOption: (data) => data,
          onSelected: onSubmit,
          optionsBuilder: _getSuggestions,
          optionsViewBuilder: (context, onSelected, results) =>
              _buildSuggestionsView(context, onSelected, results, constraints),
          fieldViewBuilder: _buildInput,
        ),
      ),
    );
  }

  Iterable<String> _getSuggestions(TextEditingValue textEditingValue) {
    if (textEditingValue.text == '') {
      return _searchSuggestions.getRange(0, 10);
    }

    return _searchSuggestions.where((str) {
      return str.startsWith(textEditingValue.text.toLowerCase());
    }).toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
  }

  ///推薦列表外層
  Widget _buildSuggestionsView(BuildContext context, onSelected,
      Iterable<String> results, BoxConstraints constraints) {
    List<Widget> items = results
        .map((str) => _buildSuggestion(context, str, () => onSelected(str)))
        .toList();
    items.insert(0, _buildSuggestionTitle(context));
    return Stack(
      children: [
        ExcludeSemantics(
          child: TextButton(
            onPressed: FocusManager.instance.primaryFocus!.unfocus,
            child: SizedBox.expand(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: $styles.insets.xxs),
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: $styles.colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all($styles.insets.xs),
            decoration: BoxDecoration(
              color: $styles.colors.white.withOpacity(0.98),
              borderRadius: BorderRadius.circular($styles.insets.xs),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: ListView(
                padding: EdgeInsets.all($styles.insets.xs),
                shrinkWrap: true,
                children: items,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSuggestionTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all($styles.insets.xs).copyWith(top: 0),
      margin: EdgeInsets.only(bottom: $styles.insets.xxs),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: $styles.colors.mainColor.withOpacity(0.1)))),
      child: Container(
        child: Text(
          '推薦',
          overflow: TextOverflow.ellipsis,
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          style: $styles.text.title2.copyWith(color: $styles.colors.black),
        ),
      ),
    );
  }

  ///推薦清單
  Widget _buildSuggestion(
      BuildContext context, String suggestion, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Padding(
          padding: EdgeInsets.all($styles.insets.xs),
          child: Text(
            suggestion,
            overflow: TextOverflow.ellipsis,
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            style: $styles.text.bodySmall
                .copyWith(color: $styles.colors.mainColor),
          )),
    );
  }

  Widget _buildInput(BuildContext context, TextEditingController textController,
      FocusNode focusNode, _) {
    Color captionColor = $styles.colors.mainColor;
    return Container(
      height: $styles.insets.xl,
      decoration: BoxDecoration(
        color: $styles.colors.white,
        borderRadius: BorderRadius.circular($styles.insets.xs),
      ),
      child: Row(
        children: [
          SizedBox(width: $styles.insets.xs * 1.5),
          Icon(Icons.search, color: $styles.colors.mainColor),
          Expanded(
            child: TextField(
              onSubmitted: onSubmit,
              controller: textController,
              focusNode: focusNode,
              style: TextStyle(color: captionColor),
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all($styles.insets.xs),
                labelStyle: TextStyle(color: captionColor),
                hintStyle: TextStyle(color: captionColor.withOpacity(0.5)),
                prefixStyle: TextStyle(color: captionColor),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Search',
              ),
            ),
          ),
          SizedBox(width: $styles.insets.xs),
          ValueListenableBuilder(
            valueListenable: textController,
            builder: (_, value, __) => Visibility(
              visible: textController.value.text.isNotEmpty,
              child: Padding(
                padding: EdgeInsets.only(right: $styles.insets.xs),
                child: TextButton(
                  child: Icon(Icons.close),
                  onPressed: () {
                    textController.clear();
                    onSubmit('');
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
