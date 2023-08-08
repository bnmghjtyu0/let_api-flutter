import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_api_flutter/src/core/models/kkbox/common/tracks.dart';

part 'search_kkbox_api.freezed.dart';
part 'search_kkbox_api.g.dart';

@freezed
class SearchKKBOX with _$SearchKKBOX {
  const factory SearchKKBOX(
      {Tracks? tracks, Paging? paging, Summary? summary}) = _SearchKKBOX;

  factory SearchKKBOX.fromJson(Map<String, dynamic> json) =>
      _$SearchKKBOXFromJson(json);
}
