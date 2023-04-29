import 'package:json_annotation/json_annotation.dart';
part 'dishes_model.g.dart';

@JsonSerializable()
class DishesResponce {
    List<Dish> dishes;
    List<PopularDish> popularDishes;

    DishesResponce({
        required this.dishes,
        required this.popularDishes,
    });
   factory DishesResponce.fromJson(Map<String, dynamic> json) => _$DishesResponceFromJson(json); 

}

@JsonSerializable()
class Dish {
    String name;
    double rating;
    String description;
    List<String> equipments;
    String image;
    int id;

    Dish({
        required this.name,
        required this.rating,
        required this.description,
        required this.equipments,
        required this.image,
        required this.id,
    });

factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);
}

@JsonSerializable()
class PopularDish {
    String name;
    String image;
    int id;

    PopularDish({
        required this.name,
        required this.image,
        required this.id,
    });
factory PopularDish.fromJson(Map<String, dynamic> json) => _$PopularDishFromJson(json);
}
