import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter/Models/entities.dart';
import 'package:surf_flutter/Models/input.dart';
import 'package:surf_flutter/Widgets/footer_widget.dart';
import 'package:collection/collection.dart';

import 'Models/product_model.dart';
import 'Widgets/personal_widget.dart';
import 'custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

extension AmountType on Amount {
  String priceText() {
    switch (runtimeType) {
      case Quantity:
        return "$value шт";
      case Grams:
        final result = value / 100;
        return "$result кг";
      default:
        return "$value";
    }
  }
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  late int _index;

  final List<TabModel> _tabs = [
    TabModel("Каталог", "assets/images/article.svg"),
    TabModel("Поиск", "assets/images/search.svg"),
    TabModel("Корзина", "assets/images/local_mall.svg"),
    TabModel("Личное", "assets/images/person_outline.svg")
  ];

  List<StatelessWidget> pages = [
    CatalogWidget(),
    SearchWidget(),
    BagWidget(),
    PersonalWidget(
      elements: products
              .map((e) => ProductModel(
                  e.title,
                  e.amount.priceText(),
                  (e.price / 1000).toString(),
                  e.sale > 0 ? (e.sale / 1000).toString() : null,
                  e.imageUrl) as Object)
              .toList() +
          [
            FotterItemModel(
                title: "В вашей покупке",
                result: "7 542 руб.",
                items: [
                  FooterItemValueModel("10 товаров", "7 842 руб"),
                  FooterItemValueModel("Скидка 5%", "- 300 руб")
                ])
          ],
    )
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    _index = 0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("widget.title"),
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: CustomColorStyles.monaco, width: 1)),
            ),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: CustomFontStyles.selectedTab,
                unselectedLabelStyle: CustomFontStyles.unselectedTab,
                selectedItemColor: CustomColorStyles.washington,
                unselectedItemColor: CustomColorStyles.amsterdam,
                currentIndex: _index,
                onTap: (value) {
                  setState(() {
                    _index = value;
                    _controller.animateTo(_index);
                  });
                },
                items: _tabs
                    .mapIndexed((index, item) => BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          item.icon,
                          colorFilter: getTabColor(index),
                        ),
                        label: item.title))
                    .toList())),
        body: TabBarView(
          controller: _controller,
          children: pages,
        ));
  }

  ColorFilter getTabColor(int index) {
    return ColorFilter.mode(
        _index == index
            ? CustomColorStyles.washington
            : CustomColorStyles.amsterdam,
        BlendMode.srcIn);
  }
}

class TabModel {
  final String title;
  final String icon;

  TabModel(this.title, this.icon);
}
