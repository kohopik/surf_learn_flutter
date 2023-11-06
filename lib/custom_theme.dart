import 'package:flutter/material.dart';

@immutable
class CustomFonts extends ThemeExtension<CustomFonts> {
  final TextStyle selectedTab;
  final TextStyle unselectedTab;

  final TextStyle body;
  final TextStyle body1;

  final TextStyle largeTitle;
  final TextStyle largeTitle1;

  final TextStyle bigLargeTitle;

  const CustomFonts(
      {required this.selectedTab,
      required this.unselectedTab,
      required this.body,
      required this.body1,
      required this.largeTitle,
      required this.largeTitle1,
      required this.bigLargeTitle});

  @override
  ThemeExtension<CustomFonts> copyWith() {
    return CustomFonts(
        selectedTab: selectedTab,
        unselectedTab: unselectedTab,
        body: body,
        body1: body1,
        largeTitle: largeTitle,
        largeTitle1: largeTitle1,
        bigLargeTitle: bigLargeTitle);
  }

  @override
  ThemeExtension<CustomFonts> lerp(
      covariant ThemeExtension<CustomFonts>? other, double t) {
    if (other is! CustomFonts) {
      return this;
    }
    return CustomFonts(
        selectedTab: TextStyle.lerp(selectedTab, other.selectedTab, t)!,
        unselectedTab: TextStyle.lerp(unselectedTab, other.unselectedTab, t)!,
        body: TextStyle.lerp(body, other.body, t)!,
        body1: TextStyle.lerp(body1, other.body1, t)!,
        largeTitle: TextStyle.lerp(largeTitle, other.largeTitle, t)!,
        largeTitle1: TextStyle.lerp(largeTitle1, other.largeTitle1, t)!,
        bigLargeTitle: TextStyle.lerp(bigLargeTitle, other.bigLargeTitle, t)!);
  }
}

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color alyaska;
  final Color moscow;
  final Color london;
  final Color ivanovo;
  final Color monaco;
  final Color amsterdam;
  final Color washington;

  const CustomColors(
      {required this.alyaska,
      required this.moscow,
      required this.london,
      required this.ivanovo,
      required this.monaco,
      required this.amsterdam,
      required this.washington});

  @override
  ThemeExtension<CustomColors> copyWith() {
    return CustomColors(
        alyaska: alyaska,
        moscow: moscow,
        london: london,
        ivanovo: ivanovo,
        monaco: monaco,
        amsterdam: amsterdam,
        washington: washington);
  }

  @override
  ThemeExtension<CustomColors> lerp(
      covariant ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
        alyaska: Color.lerp(alyaska, other.alyaska, t)!,
        moscow: Color.lerp(moscow, other.moscow, t)!,
        london: Color.lerp(london, other.moscow, t)!,
        ivanovo: Color.lerp(ivanovo, other.moscow, t)!,
        monaco: Color.lerp(monaco, other.moscow, t)!,
        amsterdam: Color.lerp(amsterdam, other.moscow, t)!,
        washington: Color.lerp(washington, other.moscow, t)!);
  }
}
