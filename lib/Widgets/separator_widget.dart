import 'package:flutter/material.dart';
import 'package:surf_flutter/Widgets/widget_factory.dart';

class SeparatorModel implements WidgetFactory {
  @override
  Widget build() {
    return Expanded(
        child: Container(height: 1, color: Color.fromRGBO(241, 241, 241, 1)));
  }
}
