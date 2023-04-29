// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'particulardish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticularDishResponce _$ParticularDishResponceFromJson(
        Map<String, dynamic> json) =>
    ParticularDishResponce(
      name: json['name'] as String,
      id: json['id'] as int,
      timeToPrepare: json['timeToPrepare'] as String,
      ingredients:
          Ingredients.fromJson(json['ingredients'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParticularDishResponceToJson(
        ParticularDishResponce instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'timeToPrepare': instance.timeToPrepare,
      'ingredients': instance.ingredients,
    };

Ingredients _$IngredientsFromJson(Map<String, dynamic> json) => Ingredients(
      vegetables: (json['vegetables'] as List<dynamic>)
          .map((e) => Spice.fromJson(e as Map<String, dynamic>))
          .toList(),
      spices: (json['spices'] as List<dynamic>)
          .map((e) => Spice.fromJson(e as Map<String, dynamic>))
          .toList(),
      appliances: (json['appliances'] as List<dynamic>)
          .map((e) => Appliance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IngredientsToJson(Ingredients instance) =>
    <String, dynamic>{
      'vegetables': instance.vegetables,
      'spices': instance.spices,
      'appliances': instance.appliances,
    };

Appliance _$ApplianceFromJson(Map<String, dynamic> json) => Appliance(
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ApplianceToJson(Appliance instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };

Spice _$SpiceFromJson(Map<String, dynamic> json) => Spice(
      name: json['name'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$SpiceToJson(Spice instance) => <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
    };
