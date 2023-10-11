import 'package:flutter/widgets.dart';
import 'package:surf_flutter/Widgets/widget_factory.dart';
import 'package:surf_flutter/custom_theme.dart';

final class FooterItemValueModel {
  final String name;
  final String value;

  FooterItemValueModel(this.name, this.value);
}

final class FotterItemModel implements WidgetFactory {
  final String title;
  final String result;
  final List<FooterItemValueModel> items;

  FotterItemModel(
      {required this.title, required this.result, required this.items});

  @override
  Widget build() {
    return FooterItemWidget(model: this);
  }
}

final class FooterItemValueWidget extends StatelessWidget {
  late final FooterItemValueModel _model;
  FooterItemValueWidget({super.key, required FooterItemValueModel model}) {
    _model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(_model.name, style: CustomFontStyles.body),
        Text(_model.value, style: CustomFontStyles.body1)
      ],
    );
  }
}

final class FooterItemWidget extends StatelessWidget {
  late final FotterItemModel _model;
  final int titleResultInset = 2;
  late final int numberOfElements;

  FooterItemWidget({required FotterItemModel model, super.key}) {
    _model = model;
    numberOfElements = model.items.length + titleResultInset;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (element, index) {
          if (index == 0) {
            return spacerBox(
                Text(
                  _model.title,
                  style: CustomFontStyles.largeTitle1,
                ),
                8);
          }
          if (index == numberOfElements - 1) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Итого", style: CustomFontStyles.largeTitle1),
                Text(_model.result, style: CustomFontStyles.largeTitle1)
              ],
            );
          }
          final model = _model.items[index - 1];
          return spacerBox(FooterItemValueWidget(model: model), 11);
        },
        itemCount: numberOfElements);
  }

  Align spacerBox(Widget child, double space) {
    return Align(
        alignment: Alignment.topLeft,
        child: Column(children: [child, SizedBox(height: space)]));
  }
}
