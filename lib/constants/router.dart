import 'package:flutter/material.dart';
import 'package:flutter_class/ui/another_page.dart';
import 'package:flutter_class/main.dart';

import '../ui/animation.dart';
import '../ui/dtabase_test.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const DatabaseTest());

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
