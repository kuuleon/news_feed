// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ArticleRecord extends DataClass implements Insertable<ArticleRecord> {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishDate;
  final String content;
  const ArticleRecord(
      {required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishDate,
      required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['url'] = Variable<String>(url);
    map['url_to_image'] = Variable<String>(urlToImage);
    map['publish_date'] = Variable<String>(publishDate);
    map['content'] = Variable<String>(content);
    return map;
  }

  ArticleRecordsCompanion toCompanion(bool nullToAbsent) {
    return ArticleRecordsCompanion(
      title: Value(title),
      description: Value(description),
      url: Value(url),
      urlToImage: Value(urlToImage),
      publishDate: Value(publishDate),
      content: Value(content),
    );
  }

  factory ArticleRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArticleRecord(
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      url: serializer.fromJson<String>(json['url']),
      urlToImage: serializer.fromJson<String>(json['urlToImage']),
      publishDate: serializer.fromJson<String>(json['publishDate']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'url': serializer.toJson<String>(url),
      'urlToImage': serializer.toJson<String>(urlToImage),
      'publishDate': serializer.toJson<String>(publishDate),
      'content': serializer.toJson<String>(content),
    };
  }

  ArticleRecord copyWith(
          {String? title,
          String? description,
          String? url,
          String? urlToImage,
          String? publishDate,
          String? content}) =>
      ArticleRecord(
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishDate: publishDate ?? this.publishDate,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('ArticleRecord(')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishDate: $publishDate, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(title, description, url, urlToImage, publishDate, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleRecord &&
          other.title == this.title &&
          other.description == this.description &&
          other.url == this.url &&
          other.urlToImage == this.urlToImage &&
          other.publishDate == this.publishDate &&
          other.content == this.content);
}

class ArticleRecordsCompanion extends UpdateCompanion<ArticleRecord> {
  final Value<String> title;
  final Value<String> description;
  final Value<String> url;
  final Value<String> urlToImage;
  final Value<String> publishDate;
  final Value<String> content;
  const ArticleRecordsCompanion({
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishDate = const Value.absent(),
    this.content = const Value.absent(),
  });
  ArticleRecordsCompanion.insert({
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishDate,
    required String content,
  })  : title = Value(title),
        description = Value(description),
        url = Value(url),
        urlToImage = Value(urlToImage),
        publishDate = Value(publishDate),
        content = Value(content);
  static Insertable<ArticleRecord> custom({
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? url,
    Expression<String>? urlToImage,
    Expression<String>? publishDate,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (publishDate != null) 'publish_date': publishDate,
      if (content != null) 'content': content,
    });
  }

  ArticleRecordsCompanion copyWith(
      {Value<String>? title,
      Value<String>? description,
      Value<String>? url,
      Value<String>? urlToImage,
      Value<String>? publishDate,
      Value<String>? content}) {
    return ArticleRecordsCompanion(
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishDate: publishDate ?? this.publishDate,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (publishDate.present) {
      map['publish_date'] = Variable<String>(publishDate.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticleRecordsCompanion(')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishDate: $publishDate, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $ArticleRecordsTable extends ArticleRecords
    with TableInfo<$ArticleRecordsTable, ArticleRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticleRecordsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _urlToImageMeta = const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String> urlToImage = GeneratedColumn<String>(
      'url_to_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _publishDateMeta =
      const VerificationMeta('publishDate');
  @override
  late final GeneratedColumn<String> publishDate = GeneratedColumn<String>(
      'publish_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [title, description, url, urlToImage, publishDate, content];
  @override
  String get aliasedName => _alias ?? 'article_records';
  @override
  String get actualTableName => 'article_records';
  @override
  VerificationContext validateIntegrity(Insertable<ArticleRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image']!, _urlToImageMeta));
    } else if (isInserting) {
      context.missing(_urlToImageMeta);
    }
    if (data.containsKey('publish_date')) {
      context.handle(
          _publishDateMeta,
          publishDate.isAcceptableOrUnknown(
              data['publish_date']!, _publishDateMeta));
    } else if (isInserting) {
      context.missing(_publishDateMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ArticleRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArticleRecord(
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      url: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      urlToImage: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}url_to_image'])!,
      publishDate: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}publish_date'])!,
      content: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
    );
  }

  @override
  $ArticleRecordsTable createAlias(String alias) {
    return $ArticleRecordsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $ArticleRecordsTable articleRecords = $ArticleRecordsTable(this);
  late final NewsDao newsDao = NewsDao(this as MyDatabase);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [articleRecords];
}
