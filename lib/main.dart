import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter/Models/input.dart';
import 'package:collection/collection.dart';
import 'package:surf_flutter/Widgets/other_screen_widgets.dart';

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
      ).copyWith(extensions: <ThemeExtension<dynamic>>[
        const CustomColors(
            alyaska: Color.fromRGBO(241, 241, 241, 1),
            moscow: Color.fromRGBO(37, 40, 73, 1),
            london: Colors.red,
            ivanovo: Color.fromRGBO(181, 181, 181, 1),
            monaco: Color.fromRGBO(121, 100, 100, 1),
            amsterdam: Color.fromRGBO(96, 96, 123, 1),
            washington: Color.fromRGBO(103, 205, 0, 1)),
        const CustomFonts(
            selectedTab: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
            unselectedTab:
                TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
            body: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
            body1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
            largeTitle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            largeTitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            bigLargeTitle:
                TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700))
      ]),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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

  List<Widget> pages = [
    const CatalogWidget(),
    const SearchWidget(),
    const BagWidget(),
    PersonalWidget(products)
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
    final CustomColors colors = Theme.of(context).extension<CustomColors>()!;
    final CustomFonts fonts = Theme.of(context).extension<CustomFonts>()!;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Шестёрочка"),
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: colors.alyaska, width: 1)),
            ),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: fonts.selectedTab,
                unselectedLabelStyle: fonts.unselectedTab,
                selectedItemColor: colors.washington,
                unselectedItemColor: colors.amsterdam,
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
                          colorFilter: getTabColor(index, colors),
                        ),
                        label: item.title))
                    .toList())),
        body: TabBarView(
          controller: _controller,
          children: pages,
        ));
  }

  ColorFilter getTabColor(int index, CustomColors colors) {
    return ColorFilter.mode(
        _index == index ? colors.washington : colors.amsterdam,
        BlendMode.srcIn);
  }
}

class TabModel {
  final String title;
  final String icon;

  TabModel(this.title, this.icon);
}
