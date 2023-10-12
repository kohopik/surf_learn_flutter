import 'package:surf_flutter/Models/entities.dart';

extension AmountType on Amount {
  String amountText() {
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

extension PriceText on double {
  String toRub() {
    return "${this / 1000} руб.";
  }
}
