import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter/Models/entities.dart';
import 'package:surf_flutter/Models/price_sortable.dart';
import 'package:surf_flutter/Models/product_model.dart';
import 'package:surf_flutter/Widgets/product_section_widget.dart';
import 'package:surf_flutter/Widgets/sort_widget.dart';
import 'package:surf_flutter/Widgets/widget_factory.dart';
import 'package:surf_flutter/custom_theme.dart';
import "package:collection/collection.dart";
import 'package:surf_flutter/main.dart';

import 'footer_widget.dart';
import 'headItem_widget.dart';

class PersonalWidget extends StatefulWidget {
  final List<ProductEntity> _elements;

  PersonalWidget(this._elements, {super.key});

  @override
  PersonalWidgetState createState() => PersonalWidgetState();
}

class PersonalWidgetState extends State<PersonalWidget> {
  List<WidgetFactory> _listItems = [];

  @override
  void initState() {
    super.initState();
    updateList();
  }

  void updateList({PriceSortable<ProductEntity>? sortable}) {
    _listItems.clear();
    _listItems.add(
      HeadItemModel(
          "Список продуктов", "assets/images/sort.svg", sortable != null, () {
        showContext(context);
      }),
    );
    _listItems.addAll(makeElements(sortable: sortable));

    final totalSum =
        widget._elements.fold(0, (value, element) => value + element.price) /
            1000;
    final totalSale = widget._elements
            .fold(0.toDouble(), (value, element) => value + element.sale) /
        1000;
    final sumWithSale = (totalSum - totalSale.toDouble());
    final salePercent = (totalSale / totalSum).toStringAsFixed(5);

    _listItems.add(FotterItemModel(
        title: "В вашей покупке",
        result: "${sumWithSale.toStringAsFixed(2)} руб.",
        items: [
          FooterItemValueModel("${widget._elements.length} товаров",
              "${totalSum.toStringAsFixed(2)} руб"),
          FooterItemValueModel(
              "Скидка $salePercent%", "- ${totalSale.toStringAsFixed(2)} руб")
        ]));
  }

  List<WidgetFactory> makeElements({PriceSortable<ProductEntity>? sortable}) {
    final groupedItems = groupBy(widget._elements, (p0) => p0.category.name);
    List<WidgetFactory> items = [];
    groupedItems.forEach((key, value) {
      items.add(ProductSectionModel(
          key,
          (sortable != null ? sortable.sort(value) : value)
              .map((e) => ProductModel(
                  e.title,
                  e.category,
                  e.amount.amountText(),
                  e.price.toDouble().toRub(),
                  e.sale > 0 ? (e.sale + e.price).toRub() : null,
                  e.imageUrl))
              .toList()));
    });
    return items;
  }

  void showContext(BuildContext context) {
    showStickyFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.5,
      bottomSheetColor: Colors.white,
      maxHeight: 1,
      headerHeight: 64,
      context: context,
      headerBuilder: (BuildContext context, double offset) {
        return SizedBox(
            height: 64,
            child: Stack(children: [
              Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 4,
                      width: 24,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(181, 181, 181, 0.12),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Сортировка",
                        style: CustomFontStyles.bigLargeTitle,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                            "assets/images/close.svg",
                            fit: BoxFit.scaleDown,
                          ))
                    ],
                  ))
            ]));
      },
      bodyBuilder: (BuildContext context, double offset) {
        return SliverChildListDelegate([
          Material(
            color: Colors.transparent,
            child: SortWidget(
              items: [
                SortModel("По возрастанию", false, () {
                  setState(() {
                    updateList(sortable: PriceSortable(true));
                  });
                }),
                SortModel("По убыванию", false, () {
                  setState(() {
                    updateList(sortable: PriceSortable(false));
                  });
                })
              ],
            ),
          ),
        ]);
      },
      anchors: [0, 0.5, 1],
      isSafeArea: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.only(top: 16, bottom: 40),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final model = _listItems[index];
            return model.build();
          },
          itemCount: _listItems.length,
        )));
  }
}
