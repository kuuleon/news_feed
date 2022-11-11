import 'package:flutter/material.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/repository/news_repository.dart';
import 'package:news_feed/data/search_type.dart' as st;
import '../data/category_info.dart'; //asにしないとimportできない？

class HeadLineViewModel extends ChangeNotifier {
  final NewsRepository _repository;

  HeadLineViewModel({repository}) : _repository = repository;

  //カプセル化
  // _searchTypeはクラスの外側からアクセスできない
  // get経由でアクセスすることで値を取得するだけできる
  st.SearchType _searchType = st.SearchType.CATEGORY;
  st.SearchType get SearchType => _searchType;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article> _articles = [];
  List<Article> get articles => _articles;

  Future<void> getHeadLines({required st.SearchType searchType}) async {
    _searchType = searchType;
    _isLoading = true;
    notifyListeners();

    _articles = await _repository.getNews(searchType: st.SearchType.HEAD_LINE);
    print("searchType: $searchType articles: ${_articles[0].title}");

    _isLoading = false;
    notifyListeners();
  }
}
