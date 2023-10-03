import 'package:flutter/widgets.dart';
import 'package:surf_flutter/custom_theme.dart';

import '../Models/product_model.dart';

class ItemWidget extends StatelessWidget {
  final ProductModel model;

  const ItemWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
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
                            style: CustomFontStyles.body,
                          )),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            model.count,
                            style: CustomFontStyles.body,
                          ),
                          if (model.sale != null)
                            Text(model.sale!, style: CustomFontStyles.body1),
                          Text(model.price, style: CustomFontStyles.body1)
                        ])
                  ],
                ))
              ],
            )));
  }
}
