import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/view/components/article_tile.dart';
import 'package:news_feed/view/components/category_chips.dart';
import 'package:news_feed/view/screens/news_web_page_screen.dart';
import 'package:news_feed/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../components/search_bar.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ページ開いたときデータを取ってくる
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    //viewModelがロードしていない&&記事がひとつもない場合→画面が開いた際に「総合カテゴリー」を取得
    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getNews(
          searchType: SearchType.CATEGORY, category: categories[0]));
    }
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: "更新",
          onPressed: () => onRefresh(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //todo 検索ワード
              SearchBar(
                onSearch: (keyword) => getKeywordNews(context, keyword),
              ),
              CategoryChips(
                  onCategorySelected: (category) =>
                      getCategoryNews(context, category)),
              //記事表示
              Expanded(child:
                  Consumer<NewsListViewModel>(builder: (context, model, child) {
                // return CircularProgressIndicator();
                return model.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: model.articles.length,
                        itemBuilder: (context, int position) => ArticleTile(
                              article: model.articles[position],
                              onArticleClicked: (article) =>
                                  _openArticleWebPage(article, context),
                            ));
              })),
            ],
          ),
        ),
      ),
    );
  }

  //記事更新処理
  Future<void> onRefresh(BuildContext context) async {
    // onRefreshはもう一度同じことをするだけ
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: viewModel.SearchType,
      keyword: viewModel.keyword,
      category: viewModel.category,
    );
    print("NewsListPage.onRefresh");
  }

  //キーワード記事取得処理
  Future<void> getKeywordNews(BuildContext context, keyword) async {
    //サーチタイプ:入力されたもの キーワード:キーワード カテゴリー:[0]総合
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.KEYWORD,
      keyword: keyword,
      category: categories[0],
    );
    print("NewsListPage.getKeywordNews");
  }

  //カテゴリー記事取得記事
  Future<void> getCategoryNews(BuildContext context, Category category) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.CATEGORY,
      category: category,
    );
    print("NewsListPage.getCategoryNews / category: ${category.nameJp}");
  }

  _openArticleWebPage(Article article, BuildContext context) {
    print("_openArticleWebPage: ${article.url}");
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NewsWebPageScreen(
        article: article,
      ),
    ));
  }
}
