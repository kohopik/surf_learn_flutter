import 'package:flutter/material.dart';
import 'package:surf_flutter/Widgets/widget_factory.dart';
import 'package:surf_flutter/custom_theme.dart';

final class TextHeadModel extends WidgetFactory {
  final String title;

  TextHeadModel(this.title);

  @override
  Widget build() {
    return Text(
      title,
      style: CustomFontStyles.largeTitle1,
    );
  }
}
