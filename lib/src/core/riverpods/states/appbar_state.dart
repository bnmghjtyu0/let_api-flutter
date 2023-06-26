class AppBarState {
  @override
  final String title;

  AppBarState({
    this.title = '123',
  });

  AppBarState copy({
    String? title,
  }) =>
      AppBarState(
        title: title ?? this.title,
      );
}
