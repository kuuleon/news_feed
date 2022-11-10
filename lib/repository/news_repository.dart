import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/main.dart';
import 'package:news_feed/models/db/dao.dart';
import 'package:news_feed/models/db/database.dart';
import 'package:news_feed/models/model/news_model.dart';

import 'package:news_feed/util/extensions.dart';

// データを取得するmodel(repository)
//これをviewModelの中から使う
class NewsRepository {
  static const BASE_URL =
      "https://newsapi.org/v2/top-headlines?country=jp"; //baseurl は変数にする
  static const API_KEY = "4701c76a4092416898a689d2f595d08d";

  Future<List<Article>> getNews(
      {required SearchType searchType,
      String? keyword,
      Category? category}) async {
    List<Article> results = [];
    http.Response? response;

    switch (searchType) {
      case SearchType.HEAD_LINE:
        final requestUrl = Uri.parse(BASE_URL + "&apikey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.KEYWORD:
        final requestUrl =
            Uri.parse(BASE_URL + "&q=$keyword&pageSize=30&apikey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.CATEGORY:
        final requestUrl = Uri.parse(
            BASE_URL + "&category=${category?.nameEn}&apikey=$API_KEY");
        response = await http.get(requestUrl);
        break;
    }

    if (response.statusCode == 200) {
      final responseBody = response.body;
      // results = News.fromJson(jsonDecode(responseBody)).articles;
      results = await insertAndReadFromDB(jsonDecode(responseBody));
    } else {
      throw Exception("failed to load news");
    }
    return results;
  }

  Future<List<Article>> insertAndReadFromDB(responseBody) async {
    final dao = myDatabase.newsDao;
    final articles = News.fromJson(responseBody).articles;

    //WEBから取得した記事リスト（dartのモデルクラス;Article）をDBのテーブルクラス（Articles）に変換してDB登録・DBから取得
    final ArticleRecords =
        await dao.insertAndReadNewsFromDB(articles.toArticleRecords(articles));

    // DBから取得したデータをモデルクラスに再変換して返す
    return ArticleRecords.toArticles(ArticleRecords);
  }
}
