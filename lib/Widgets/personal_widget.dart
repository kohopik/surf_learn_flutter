import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Models/product_model.dart';
import 'footer_widget.dart';
import 'headItem_widget.dart';
import 'item_widget.dart';

class PersonalWidget extends StatelessWidget {
  final List<Object> _list = [];

  PersonalWidget({super.key, required List<Object> elements}) {
    _list.add(
      HeadItemModel("Список продуктов", "assets/images/sort.svg"),
    );
    _list.addAll(elements);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.only(top: 16, bottom: 40),
          itemBuilder: (BuildContext context, int index) {
            final model = _list[index];
            switch (model.runtimeType) {
              case ProductModel:
                ProductModel productModel = model as ProductModel;
                return ItemWidget(model: productModel);
              case HeadItemModel:
                HeadItemModel headModel = model as HeadItemModel;
                return HeadItemWidget(model: headModel);
              case FotterItemModel:
                FotterItemModel footerModel = model as FotterItemModel;
                return FooterItemWidget(model: footerModel);
              default:
                break;
            }
          },
          itemCount: _list.length,
        )));
  }
}

class CatalogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Экран каталога',
          ),
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Экран поиска',
          ),
        ],
      ),
    );
  }
}

class BagWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Экран корзины',
          ),
        ],
      ),
    );
  }
}
