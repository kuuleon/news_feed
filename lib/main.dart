import 'package:flutter/material.dart';
import 'package:news_feed/di/providers.dart';
import 'package:news_feed/models/db/database.dart';
import 'package:news_feed/view/style/style.dart';
import 'package:news_feed/viewmodels/head_line_viewmodel.dart';
import 'package:news_feed/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

import 'view/screens/home_screen.dart';

// ChangeNotifierProviderはツリーの最上位に置くことで全てのwidgetで利用できる
void main() {
  //複数のproviderを管理するMultiProvider class
  //listだがproviderは登録する順番に読み込まれる!!!
  runApp(MultiProvider(
    providers: globalProviders,
    child: MyApp(), //子供にMyAppを持ってくる
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
