import 'package:surf_flutter/Models/entities.dart';

class ItemModel {
  final String title;
  final String count;
  final String price;
  final String? sale;
  final Category category;
  final String imageUrl;

  ItemModel(this.title, this.category, this.count, this.price, this.sale,
      this.imageUrl);
}
