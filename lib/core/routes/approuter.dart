import 'package:bmiapp/features/DetailsScreen/views/DetailsScreenView.dart';
import 'package:bmiapp/features/HomeScreen/views/HomeScreenView.dart';
import 'package:flutter/material.dart';
class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings) {
      case "DetailsScreenView":
        return MaterialPageRoute(builder: (context) => DetailsScreenView());
      default :
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreenView();
          },
        );
    }
  }
}