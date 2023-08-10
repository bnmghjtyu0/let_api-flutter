// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:let_api_flutter/src/core/models/kkbox/common/tracks.dart';

part 'chart_detail.freezed.dart';
part 'chart_detail.g.dart';

@freezed
class ChartDetailResponse with _$ChartDetailResponse {
  const factory ChartDetailResponse({
    Tracks? tracks,
    String? id,
    String? title,
    String? description,
    String? url,
    List<Images>? images,
    String? updatedAt,
    Owner? owner,
  }) = _ChartDetailResponse;

  factory ChartDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ChartDetailResponseFromJson(json);
}

@freezed
class Owner with _$Owner {
  const factory Owner({
    String? id,
    String? url,
    String? name,
    String? description,
    List<Images>? images,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
