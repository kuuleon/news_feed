import 'package:flutter/material.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/view/components/article_tile_desc.dart';
import 'package:news_feed/view/components/image_from_url.dart';

class ArticleTile extends StatelessWidget {
  final Article article;
  final ValueChanged onArticleClicked;

  const ArticleTile({required this.article, required this.onArticleClicked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        //InkWell 記事押した時のフィードバック
        child: InkWell(
          onTap: () => onArticleClicked(article),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                //todo
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageFromUrl(
                    imageUrl: article.urlToImage,
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  //todo
                  child: ArticleTileDesc(
                    article: article,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
