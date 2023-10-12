import 'package:flutter/material.dart';
import 'package:surf_flutter/Widgets/widget_factory.dart';
import 'package:surf_flutter/custom_theme.dart';

class SeparatorModel implements WidgetFactory {
  @override
  Widget build() {
    return Expanded(
        child: Container(height: 1, color: CustomColorStyles.alyaska));
  }
}
