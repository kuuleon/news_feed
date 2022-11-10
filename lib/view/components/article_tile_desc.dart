import 'package:flutter/material.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/view/style/style.dart';

//記事表示部分widget
class ArticleTileDesc extends StatelessWidget {
  final Article article;
  const ArticleTileDesc({required this.article});
  @override
  Widget build(BuildContext context) {
    // material designのtextThemeでfontStyle
    //このcontext = MaterialApp
    final TextTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          article.title ?? "",
          style: TextTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Text(article.publishDate ?? "",
            style: TextTheme.overline?.copyWith(fontStyle: FontStyle.italic)),
        const SizedBox(
          height: 2.0,
        ),
        Text(article.description ?? "",
            style: TextTheme.bodyText1?.copyWith(fontFamily: RegularFont)),
      ],
    );
  }
}
