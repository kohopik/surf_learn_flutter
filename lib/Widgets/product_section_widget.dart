import 'package:flutter/material.dart';
import 'package:surf_flutter/Models/item_model.dart';
import 'package:surf_flutter/Widgets/item_widget.dart';
import 'package:surf_flutter/Widgets/text_head_widget.dart';
import 'package:surf_flutter/Widgets/separator_widget.dart';

class ProductSectionWidget extends StatelessWidget {
  final String title;
  final List<ItemModel> elements;

  const ProductSectionWidget(
      {super.key, required this.elements, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return TextHeaderWidget(title);
        }

        if (index == elements.length + 1) {
          return const SeparatorWidget();
        }

        return ItemWidget(model: elements[index - 1]);
      },
      itemCount: elements.length + 2,
    );
  }
}
