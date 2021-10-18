import 'package:flutter/material.dart';
import 'package:flutter_class/another_page.dart';
import 'package:flutter_class/main.dart';

import 'animation.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const AnotherPage());

      case '/myHomePage':
        return MaterialPageRoute(
            builder: (context) => const MyHomePage(title: 'title'));

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Text('Route Not Found'),
                ));
    }
  }
}
