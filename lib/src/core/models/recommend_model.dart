import 'package:freezed_annotation/freezed_annotation.dart';
part 'recommend_model.freezed.dart';
part 'recommend_model.g.dart';

@freezed
class Recommend with _$Recommend {
  const factory Recommend(
      {int? totalSize,
      int? typeId,
      int? offset,
      List<RecommendModel>? products}) = _Recommend;

  factory Recommend.fromJson(Map<String, dynamic> json) =>
      _$RecommendFromJson(json);
}

@freezed
class RecommendModel with _$RecommendModel {
  const factory RecommendModel(
      {int? id,
      String? name,
      String? description,
      int? price,
      int? stars,
      String? img,
      String? location,
      String? createdAt,
      String? updatedAt,
      int? typeId}) = _RecommendModel;

  factory RecommendModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendModelFromJson(json);
}
