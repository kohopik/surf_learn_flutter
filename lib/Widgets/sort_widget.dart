import 'package:flutter/material.dart';
import 'package:surf_flutter/custom_theme.dart';

class SortModel {
  final String name;
  bool isSelected;
  Function onSelect;

  SortModel(this.name, this.isSelected, this.onSelect);
}

class SortWidget extends StatefulWidget {
  final List<SortModel> _items = [];
  SortWidget({super.key, required List<SortModel> items}) {
    _items.addAll(items);
  }

  @override
  SortWidgetState createState() => SortWidgetState();
}

class SortWidgetState extends State<SortWidget> {
  SortModel? selectedOption;

  @override
  Widget build(BuildContext context) {
    final CustomColors colors = Theme.of(context).extension<CustomColors>()!;
    return Column(
        children: widget._items.map((model) {
      return SizedBox(
          height: 56,
          child: RadioListTile(
            contentPadding: const EdgeInsets.only(left: 10),
            title: Text(model.name),
            value: model,
            groupValue: selectedOption,
            activeColor: colors.washington,
            onChanged: (value) {
              setState(() {
                model.isSelected = true;
                selectedOption = model;
                model.onSelect();
              });
            },
          ));
    }).toList());
  }
}
