part of '../search_screen.dart';

///搜尋輸入框
class _SearchInput extends StatefulWidget {
  ///送出
  final void Function(String) onSubmit;
  final MyBuilder builder;

  ///搜尋輸入框 建構式
  const _SearchInput({Key? key, required this.onSubmit, required this.builder})
      : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

typedef MyBuilder = void Function(
    BuildContext context, void Function(String value) updateInputValue);

class _SearchInputState extends State<_SearchInput> {
  final _debouncer = Debouncer(Duration(milliseconds: 500));
  TextEditingController textController = TextEditingController();
  String inputText = '';
  OverlayEntry? _floatingOptions;
  bool _floatingOptionsUpdateScheduled = false;

  bool get _shouldShowOptions {
    return textController.text != '';
  }

  ///資料異動時調用這個方法， 接著執行 build
  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);

    _updateOverlay();
  }

  void updateInputValue(String value) {
    textController.text = value;
    widget.onSubmit('');
    _updateOverlay();
  }

  /// 參考 [Autocomplete] 元件的寫法
  /// Hide or show the options overlay, if needed.
  void _updateOverlay() {
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      if (!_floatingOptionsUpdateScheduled) {
        _floatingOptionsUpdateScheduled = true;
        SchedulerBinding.instance.addPostFrameCallback((Duration timeStamp) {
          _floatingOptionsUpdateScheduled = false;
          _updateOverlay();
        });
      }
      return;
    }

    _floatingOptions?.remove();
    if (_shouldShowOptions) {
      final OverlayEntry newFloatingOptions = OverlayEntry(
        builder: (BuildContext context) {
          return CustomOverlay<String>(
              optionsViewBuilder: (context) => SearchView(
                  inputText: textController.text, overlay: _floatingOptions));
        },
      );
      Overlay.of(context, rootOverlay: true, debugRequiredFor: widget)
          .insert(newFloatingOptions);
      _floatingOptions = newFloatingOptions;
    } else {
      _floatingOptions = null;
    }
  }

  Widget _buildInput(
    BuildContext context,
    TextEditingController textController,
  ) {
    Color captionColor = $styles.colors.black;
    double inputHeight = 1;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular($styles.insets.offset),
        ),
        child: Row(
          children: [
            SizedBox(width: $styles.insets.xs * 1.5),
            Icon(Icons.search, color: captionColor),
            Expanded(
              child: TextField(
                onSubmitted: widget.onSubmit,
                controller: textController,
                onChanged: (value) {
                  _debouncer.call(() {
                    _updateOverlay();
                  });
                },
                style: TextStyle(color: captionColor, height: inputHeight),
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  isCollapsed: true,
                  isDense: true,
                  contentPadding: EdgeInsets.all($styles.insets.xs),
                  labelStyle: TextStyle(color: captionColor),
                  hintStyle: TextStyle(color: captionColor.withOpacity(0.5)),
                  prefixStyle: TextStyle(color: captionColor),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: '搜尋商品名稱',
                ),
              ),
            ),
            SizedBox(width: $styles.insets.xs),
            ValueListenableBuilder(
              valueListenable: textController,
              builder: (_, value, __) => Visibility(
                visible: textController.value.text.isNotEmpty,
                child: TextButton(
                  child: Icon(
                    Icons.close,
                    size: 16,
                  ),
                  onPressed: () {
                    textController.clear();

                    widget.onSubmit('');
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.builder.call(context, updateInputValue);
    return Center(child: _buildInput(context, textController));
  }
}
