// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dishes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishesResponce _$DishesResponceFromJson(Map<String, dynamic> json) =>
    DishesResponce(
      dishes: (json['dishes'] as List<dynamic>)
          .map((e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList(),
      popularDishes: (json['popularDishes'] as List<dynamic>)
          .map((e) => PopularDish.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DishesResponceToJson(DishesResponce instance) =>
    <String, dynamic>{
      'dishes': instance.dishes,
      'popularDishes': instance.popularDishes,
    };

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      description: json['description'] as String,
      equipments: (json['equipments'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      image: json['image'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'name': instance.name,
      'rating': instance.rating,
      'description': instance.description,
      'equipments': instance.equipments,
      'image': instance.image,
      'id': instance.id,
    };

PopularDish _$PopularDishFromJson(Map<String, dynamic> json) => PopularDish(
      name: json['name'] as String,
      image: json['image'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$PopularDishToJson(PopularDish instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
    };
