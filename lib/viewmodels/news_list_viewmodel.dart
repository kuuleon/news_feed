import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart' as st; //asにしないとimportできない？
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/repository/news_repository.dart';

//changeNotifierの設定 4つのプロパティを設定
class NewsListViewModel extends ChangeNotifier {
  final NewsRepository _repository = NewsRepository();

  //カプセル化
  // _searchTypeはクラスの外側からアクセスできない
  // get経由でアクセスすることで値を取得するだけできる
  st.SearchType _searchType = st.SearchType.CATEGORY;
  st.SearchType get SearchType => _searchType;

  Category _category = categories[0];
  Category get category => _category;

  String _keyword = "";
  String get keyword => _keyword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article> _articles = [];
  List<Article> get articles => _articles;

  //viewから呼び出すメソッド
  Future<void> getNews(
      {required st.SearchType searchType,
      String? keyword,
      Category? category}) async {
    //viewModelから呼び出す
    // それぞれのプロパティに引数をセットする
    _searchType = searchType;
    _keyword = keyword ?? "";
    _category = category ?? categories[0];

    // データの取得が始まったらロード処理
    _isLoading = true;
    notifyListeners(); //監視もと(main.dart/changeNotifierProvider)に伝わる

    print(
        "[ViewModel] searchType: $searchType / keyword: $keyword / category: ${category?.nameJp}");

    _articles = await _repository.getNews(
      searchType: _searchType,
      keyword: _keyword,
      category: _category,
    );

    // 終わったら
    _isLoading = false;
    notifyListeners();
  }
}
