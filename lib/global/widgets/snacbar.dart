import 'package:flutter/material.dart';

import '../services/navigation_service.dart';

void showSnackBar(String message){
        ScaffoldMessenger.of( NavigationService.navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(message.toString())));
}