// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartModel _$$_CartModelFromJson(Map<String, dynamic> json) => _$_CartModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      img: json['img'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      isExist: json['isExist'] as bool? ?? false,
      time: json['time'] as String?,
      product: json['product'] ?? const {},
    );

Map<String, dynamic> _$$_CartModelToJson(_$_CartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'img': instance.img,
      'quantity': instance.quantity,
      'isExist': instance.isExist,
      'time': instance.time,
      'product': instance.product,
    };
