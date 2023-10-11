import 'package:flutter/material.dart';
import 'package:surf_flutter/Models/entities.dart';
import 'package:surf_flutter/Widgets/item_widget.dart';
import 'package:surf_flutter/Widgets/widget_factory.dart';

class ProductModel implements WidgetFactory {
  final String title;
  final String count;
  final String price;
  final String? sale;
  final Category category;
  final String imageUrl;

  ProductModel(this.title, this.category, this.count, this.price, this.sale,
      this.imageUrl);

  @override
  Widget build() {
    return ItemWidget(model: this);
  }
}
