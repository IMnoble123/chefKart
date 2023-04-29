import 'package:chefkart/global/routes/routes.dart';
import 'package:chefkart/global/services/navigation_service.dart';
import 'package:chefkart/modules/home/controllers/dishes_controller.dart';
import 'package:chefkart/modules/home/dish_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DishesController())
      ],
      child: MaterialApp(
        title: 'ChefKart blueprint',
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigatorKey,
        routes: Routes.routes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DishesScreen(),
      ),
    );
  }
}
