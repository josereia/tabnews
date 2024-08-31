import 'package:tabnews/core/domain/entities/news_entity.dart';
import 'package:tabnews/modules/news/domain/news_repository.dart';
import 'package:tabnews/modules/news/infra/news_datasource.dart';

class NewsRepositoryImpl implements NewsRepository {
  const NewsRepositoryImpl({required this.datasource});

  final NewsDatasource datasource;

  @override
  Future<NewsEntity?> getOne({
    required String user,
    required String slug,
  }) async {
    final news = await datasource.getOne(user: user, slug: slug);
    return news;
  }

  @override
  Future<List<NewsEntity>> getComments({
    required String user,
    required String slug,
  }) async {
    final comments = await datasource.getComments(user: user, slug: slug);
    return comments;
  }
}
