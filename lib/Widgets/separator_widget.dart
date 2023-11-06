import 'package:flutter/material.dart';
import 'package:surf_flutter/custom_theme.dart';

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final CustomColors colors = Theme.of(context).extension<CustomColors>()!;
    return Expanded(child: Container(height: 1, color: colors.alyaska));
  }
}
