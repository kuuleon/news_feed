import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';

//chipを押して状態が変更する&&widgetを跨がないのでstfull
class CategoryChips extends StatefulWidget {
  final ValueChanged onCategorySelected;
  CategoryChips({required this.onCategorySelected});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  var value = 0;
  @override
  Widget build(BuildContext context) {
    //Wrapにすることで要素が2行目以降に折り返す
    return Wrap(
        spacing: 6.0,
        children: List<Widget>.generate(categories.length, (int index) {
          return ChoiceChip(
            label: Text(categories[index].nameJp),
            selected: value == index,
            onSelected: (bool isSelected) {
              setState(() {
                value = isSelected ? index : 0;
                widget.onCategorySelected(categories[index]);
              });
            },
          );
        }).toList());
  }
}
