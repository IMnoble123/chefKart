import 'package:json_annotation/json_annotation.dart';
part 'particulardish_model.g.dart';

@JsonSerializable()
class ParticularDishResponce {
    String name;
    int id;
    String timeToPrepare;
    Ingredients ingredients;

    ParticularDishResponce({
        required this.name,
        required this.id,
        required this.timeToPrepare,
        required this.ingredients,
    });
    factory ParticularDishResponce.fromJson(Map<String, dynamic> json) => _$ParticularDishResponceFromJson(json);

}

@JsonSerializable()
class Ingredients {
    List<Spice> vegetables;
    List<Spice> spices;
    List<Appliance> appliances;

    Ingredients({
        required this.vegetables,
        required this.spices,
        required this.appliances,
    });
    factory Ingredients.fromJson(Map<String, dynamic> json) => _$IngredientsFromJson(json);

}

@JsonSerializable()
class Appliance {
    String name;
    String image;

    Appliance({
        required this.name,
        required this.image,
    });
    factory Appliance.fromJson(Map<String, dynamic> json) => _$ApplianceFromJson(json);

}


@JsonSerializable()
class Spice {
    String name;
    String quantity;

    Spice({
        required this.name,
        required this.quantity,
    });
    factory Spice.fromJson(Map<String, dynamic> json) => _$SpiceFromJson(json);

}
