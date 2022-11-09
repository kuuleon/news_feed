import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged onSearch;
  final TextEditingController _textEditingController = TextEditingController();

  SearchBar({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(24.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: TextField(
          onSubmitted: onSearch, //入力完了を押したとき
          maxLines: 1,
          controller: _textEditingController,
          decoration: InputDecoration(
              icon: Icon(Icons.search),
              hintText: "検索ワードを入れてください",
              border: InputBorder.none),
        ),
      ),
    );
  }
}
