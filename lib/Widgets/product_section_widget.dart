import 'package:flutter/material.dart';
import 'package:surf_flutter/Models/product_model.dart';
import 'package:surf_flutter/Models/text_head_model.dart';
import 'package:surf_flutter/Widgets/headItem_widget.dart';
import 'package:surf_flutter/Widgets/separator_widget.dart';
import 'package:surf_flutter/Widgets/widget_factory.dart';

class ProductSectionModel implements WidgetFactory {
  final String title;
  final List<ProductModel> elements;

  ProductSectionModel(this.title, this.elements);

  @override
  Widget build() {
    return ProductSectionWidget(model: this);
  }
}

class ProductSectionWidget extends StatelessWidget {
  final ProductSectionModel model;
  late final List<Widget> _items;

  ProductSectionWidget({super.key, required this.model}) {
    _items = [TextHeadModel(model.title).build()] +
        model.elements.map((e) => e.build()).toList() +
        [SeparatorModel().build()];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return _items[index];
      },
      itemCount: _items.length,
    );
  }
}
