import 'package:flutter/widgets.dart';
import 'package:surf_flutter/custom_theme.dart';

import 'highlightable_button.dart';

class HeadItemModel {
  final String title;
  final String imageURL;

  HeadItemModel(this.title, this.imageURL);
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
              child: HighlightableButton(),
            )
          ],
        ));
  }
}
