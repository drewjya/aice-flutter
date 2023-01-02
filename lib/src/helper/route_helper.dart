import 'package:flutter/material.dart';

class GenRoute {
  static routeDef({required Widget page, RouteSettings? settings}) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }
}
