import 'package:flutter/widgets.dart';
import 'package:surf_flutter/Widgets/widget_factory.dart';
import 'package:surf_flutter/custom_theme.dart';

import 'highlightable_button.dart';

class HeadItemModel implements WidgetFactory {
  final String title;
  final String imageURL;
  final bool isButtonHighlighted;
  final Function() _onTap;

  HeadItemModel(
      this.title, this.imageURL, this.isButtonHighlighted, this._onTap);

  @override
  Widget build() {
    return HeadItemWidget(model: this);
  }
}

class HeadItemWidget extends StatelessWidget {
  final HeadItemModel _model;

  const HeadItemWidget({required HeadItemModel model, super.key})
      : _model = model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_model.title, style: CustomFontStyles.largeTitle),
            SizedBox(
              width: 32,
              height: 32,
              child: HighlightableButton(
                  onTap: _model._onTap,
                  isHightlighted: _model.isButtonHighlighted),
            )
          ],
        ));
  }
}
