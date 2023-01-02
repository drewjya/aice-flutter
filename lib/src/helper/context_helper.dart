import 'package:flutter/material.dart';

class ContextHelper {
  
  static final instance = ContextHelper._init();
  ContextHelper._init();
  late Size _uiSize;

  init(BuildContext context) {
    _uiSize = MediaQuery.of(context).size;
  }

  Size get size => _uiSize;

  
}
