import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class News {
  final List<Article> articles; //フィールド list形式のarticle
  News({required this.articles}); //コンストラクタを作る
  factory News.fromJson(Map<String, dynamic> json) =>
      _$NewsFromJson(json); //jsonからモデルに変換するメソッド
  Map<String, dynamic> toJson() => _$NewsToJson(this); //モデルクラスからjsonに変換するメソッド
}

@JsonSerializable()
class Article {
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  @JsonKey(name: "publishedAt")
  final String? publishDate;
  final String? content;

  //
  Article(
      {this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishDate,
      this.content});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json); //jsonからモデルに変換するメソッド
  Map<String, dynamic> toJson() =>
      _$ArticleToJson(this); //モデルクラスからjsonに変換するメソッド
}
