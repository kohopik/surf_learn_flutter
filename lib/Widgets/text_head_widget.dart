import 'package:flutter/material.dart';
import 'package:surf_flutter/custom_theme.dart';

class TextHeaderWidget extends StatelessWidget {
  final String title;

  const TextHeaderWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final CustomFonts fonts = Theme.of(context).extension<CustomFonts>()!;
    return Text(
      title,
      style: fonts.largeTitle1,
    );
  }
}
