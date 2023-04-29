

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class  ApiException {

 static  final _connection = InternetConnectionChecker();

 static  Future<String> handle(DioError e) async {
    if (e.error.toString().contains('SocketException')) {
      if (await _connection.hasConnection) {
        return 'Server went wrong ! Please try again later ';
      } else {
        return 'Please make sure about your connection !';
      }
    } else if (e.response != null) {
      return jsonDecode(e.response.toString())['errors']['message']??
      jsonDecode(e.response.toString())['errors'] ?? '';
    }
    return 'Something went wrong ! Please try again later ';
  }
}
