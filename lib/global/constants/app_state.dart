//* State
import 'package:flutter/material.dart';

enum KState { loading, loaded, empty, error }


abstract class SateProvider extends ChangeNotifier {


  void update(void Function() update) {
    update();
    notifyListeners();
  }


  static Widget widget({required KState state, required Widget loaded, Widget? loading, Widget? empty, Widget? error}) {
    return {KState.loading: loading, KState.empty: empty, KState.error: error}[state] ?? loaded;
  }
}