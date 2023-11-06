import "package:collection/collection.dart";

abstract class Sortable<T> {
  List<T> sort(List<T> items);
}

mixin PriceSupportable {
  int get price;
}

class PriceSortable<T extends PriceSupportable> implements Sortable<T> {
  final bool _fromUpToDown;

  PriceSortable(this._fromUpToDown);

  @override
  List<T> sort(List<T> items) {
    return _fromUpToDown
        ? items.sorted((a, b) => a.price.compareTo(b.price))
        : items.sorted((a, b) => b.price.compareTo(a.price));
  }
}
