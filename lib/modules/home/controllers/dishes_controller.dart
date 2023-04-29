import 'dart:convert';
import 'package:chefkart/global/api/api.dart';
import 'package:chefkart/global/constants/app_state.dart';
import 'package:chefkart/global/models/dishes_model.dart';
import 'package:chefkart/global/models/particulardish_model.dart';
import 'package:chefkart/global/widgets/snacbar.dart';
import 'package:dio/dio.dart';

class DishesController extends SateProvider {
  DishesController() {
    getDishes();
    particularDishes();
  }

  final _baseRepository = BaseRepository();

  DishesResponce? dishes;
  ParticularDishResponce? particularDish;
  KState state = KState.loading;

  Future<void> getDishes() async {
    try {
      update(() => state = KState.loading);
      dishes = await _baseRepository.apiCall(
        call: Dio().get(ApiUris.dishUrl),
        onSuccess: (res) =>
            DishesResponce.fromJson(jsonDecode(res.data.toString())),
      );
      update(() => state = KState.loaded);
    } catch (e) {
      showSnackBar(e.toString());
      update(() => state = KState.error);
    }
  }

  Future<void> particularDishes() async {
    try {
      update(() => state = KState.loading);
      particularDish = await _baseRepository.apiCall(
        call: Dio().get(ApiUris.particularDishUrl),
        onSuccess: (res) =>
            ParticularDishResponce.fromJson(jsonDecode(res.data.toString())),
      );
          update(() => state = KState.loaded);
    } catch (e) {
      showSnackBar(e.toString());
      update(() => state = KState.error);
    }
  }
}
