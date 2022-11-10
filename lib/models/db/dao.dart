import 'package:drift/drift.dart';
import 'package:news_feed/models/db/database.dart';

part 'dao.g.dart';

@DriftAccessor(tables: [ArticleRecords])
class NewsDao extends DatabaseAccessor<MyDatabase> with _$NewsDaoMixin {
  NewsDao(MyDatabase db) : super(db);

  Future clearDB() => delete(articleRecords).go();

  Future insertDB(List<ArticleRecord> articles) async {
    await batch((batch) {
      batch.insertAll(articleRecords, articles);
    });
  }

  Future<List<ArticleRecord>> get articleFromDB => select(articleRecords).get();

  Future<List<ArticleRecord>> insertAndReadNewsFromDB(
          List<ArticleRecord> articles) =>
      transaction(() async {
        await clearDB();
        await insertDB(articles);
        return await articleFromDB;
      });
}
