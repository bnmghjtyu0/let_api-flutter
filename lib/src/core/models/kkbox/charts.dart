import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_api_flutter/src/core/models/kkbox/common/tracks.dart';

part 'charts.freezed.dart';
part 'charts.g.dart';

@freezed
class ChartsKKBOXResponse with _$ChartsKKBOXResponse {
  const factory ChartsKKBOXResponse(
      {List<Data>? data,
      Paging? paging,
      Summary? summary}) = _ChartsKKBOXResponse;

  factory ChartsKKBOXResponse.fromJson(Map<String, dynamic> json) =>
      _$ChartsKKBOXResponseFromJson(json);
}
