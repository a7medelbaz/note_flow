import 'package:flutter/material.dart';
import 'package:note_flow/core/constants/my_strings.dart';
import 'package:note_flow/layers/ui/screens/home_page.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.homePageRoute:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      default:
    }
    return null;
  }
}
