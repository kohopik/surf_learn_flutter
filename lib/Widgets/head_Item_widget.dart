import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surf_flutter/custom_theme.dart';

import 'highlightable_button.dart';

class HeadItemModel {
  final String title;
  final String imageURL;
  final bool isButtonHighlighted;
  final Function() _onTap;

  HeadItemModel(
      this.title, this.imageURL, this.isButtonHighlighted, this._onTap);
}

class HeadItemWidget extends StatelessWidget {
  final HeadItemModel _model;

  const HeadItemWidget({required HeadItemModel model, super.key})
      : _model = model;

  @override
  Widget build(BuildContext context) {
    final CustomFonts fonts = Theme.of(context).extension<CustomFonts>()!;
    return SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_model.title, style: fonts.largeTitle),
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
