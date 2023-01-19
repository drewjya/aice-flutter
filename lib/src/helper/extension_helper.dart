import 'package:flutter/material.dart';

extension ContextSpecial on num {
  double  width(context) => MediaQuery.of(context).size.width * this / 100;
  double  height(context) => MediaQuery.of(context).size.height * this / 100;
}
