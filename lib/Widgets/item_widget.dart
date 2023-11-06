import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surf_flutter/custom_theme.dart';

import '../Models/item_model.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel model;

  const ItemWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final CustomColors colors = Theme.of(context).extension<CustomColors>()!;
    final CustomFonts fonts = Theme.of(context).extension<CustomFonts>()!;
    return SizedBox(
        height: 100,
        child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              children: [
                SizedBox(
                    width: 68,
                    height: 68,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: FadeInImage(
                            placeholder: const AssetImage(
                                "assets/images/placeholder.png"),
                            image: NetworkImage(model.imageUrl),
                            fit: BoxFit.cover))),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Expanded(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            model.title,
                            textAlign: TextAlign.left,
                            style: fonts.body,
                          )),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            model.count,
                            style: fonts.body,
                          ),
                          Row(children: [
                            if (model.sale != null)
                              Text(
                                model.sale!,
                                style: fonts.body1.apply(
                                    decoration: TextDecoration.lineThrough,
                                    color: colors.ivanovo),
                              ),
                            if (model.sale != null) const SizedBox(width: 16),
                            Text(model.price,
                                style: fonts.body1.apply(
                                    color: model.sale == null
                                        ? colors.moscow
                                        : colors.london))
                          ])
                        ])
                  ],
                ))
              ],
            )));
  }
}
