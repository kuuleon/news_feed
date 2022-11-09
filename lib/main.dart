import 'package:flutter/material.dart';
import 'package:news_feed/view/style/style.dart';
import 'package:news_feed/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

import 'view/screens/home_screen.dart';

// ChangeNotifierProviderはツリーの最上位に置くことで全てのwidgetで利用できる
void main() {
  runApp(ChangeNotifierProvider<NewsListViewModel>(
    create: (context) => NewsListViewModel(),
    child: MyApp(), //子供にMyappを持ってくる
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NewsFeed",
      theme: ThemeData(brightness: Brightness.dark, fontFamily: BoldFont),
      home: HomeScreen(),
    );
  }
}
