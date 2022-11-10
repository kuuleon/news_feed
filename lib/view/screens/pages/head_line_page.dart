import 'package:flutter/material.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/view/components/head_line_item.dart';
import 'package:news_feed/view/components/page_transfomer.dart';
import 'package:news_feed/view/screens/news_web_page_screen.dart';
import 'package:news_feed/viewmodels/head_line_viewmodel.dart';
import 'package:provider/provider.dart';

//トップニュース
class HeadLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<HeadLineViewModel>(context, listen: false);
    final viewModel = context.read<HeadLineViewModel>();

    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getHeadLines(searchType: SearchType.HEAD_LINE));
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<HeadLineViewModel>(
            builder: (context, model, child) {
              if (model.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                //ページスワイプ
                return PageTransformer(
                  pageViewBuilder: ((context, pageVisibilityResolver) {
                    return PageView.builder(
                        controller: PageController(
                          viewportFraction: 0.9,
                        ), //各ページを管理するコントローラーの設定
                        itemCount: model.articles.length, //データリストの行数をセット
                        itemBuilder: (context, index) {
                          final article = model.articles[index];
                          final PageVisibility = pageVisibilityResolver
                              .resolvePageVisibility(index);
                          final visibleFraction =
                              PageVisibility.visibleFraction;
                          //データを表示させるwidget
                          return HeadLineItem(
                            article: model.articles[index],
                            pageVisibility: PageVisibility,
                            onArticleClicked: (article) =>
                                _openArticleWebPage(context, article),
                          );
                        });
                  }),
                );
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => onRefresh(context),
        ),
      ),
    );
  }

  //更新処理
  onRefresh(BuildContext context) async {
    print("Headlinepage.onrefresh");
    final viewModel = context.read<HeadLineViewModel>();
    await viewModel.getHeadLines(searchType: SearchType.HEAD_LINE);
  }

  _openArticleWebPage(BuildContext context, Article article) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NewsWebPageScreen(
        article: article,
      ),
    ));
  }
}

// page viewはスワイプしたそれぞれのページが全く別のページ構成
// page view builderは同じviewの形でデータだけ違う
