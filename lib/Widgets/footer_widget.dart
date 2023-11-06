import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surf_flutter/custom_theme.dart';

final class FooterItemValueModel {
  final String name;
  final String value;

  FooterItemValueModel(this.name, this.value);
}

final class FooterItemValueWidget extends StatelessWidget {
  late final FooterItemValueModel _model;
  FooterItemValueWidget({super.key, required FooterItemValueModel model}) {
    _model = model;
  }

  @override
  Widget build(BuildContext context) {
    final CustomFonts fonts = Theme.of(context).extension<CustomFonts>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(_model.name, style: fonts.body),
        Text(_model.value, style: fonts.body1)
      ],
    );
  }
}

final class FooterItemWidget extends StatelessWidget {
  final String title;
  final String result;
  final List<FooterItemValueModel> items;
  final int titleResultInset = 2;

  const FooterItemWidget(
      {required this.title,
      required this.result,
      required this.items,
      super.key});

  @override
  Widget build(BuildContext context) {
    final CustomFonts fonts = Theme.of(context).extension<CustomFonts>()!;
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (element, index) {
          if (index == 0) {
            return spacerBox(
                Text(
                  title,
                  style: fonts.largeTitle1,
                ),
                8);
          }
          if (index == items.length + titleResultInset - 1) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Итого", style: fonts.largeTitle1),
                Text(result, style: fonts.largeTitle1)
              ],
            );
          }
          final model = items[index - 1];
          return spacerBox(FooterItemValueWidget(model: model), 11);
        },
        itemCount: items.length + titleResultInset);
  }

  Align spacerBox(Widget child, double space) {
    return Align(
        alignment: Alignment.topLeft,
        child: Column(children: [child, SizedBox(height: space)]));
  }
}
