import 'package:my_news_app/models/categories_new_model.dart';
import 'package:my_news_app/models/news_channel_headlines_model.dart';
import 'package:my_news_app/repository/news_repository.dart';

class NewsViewModel {
  final NewsRepository _newsRepository = NewsRepository();

  Future<NewschannelsHeadlinesModel> fetchNewsChannelHeadlinesApi(String name) async {
    try {
      final response = await _newsRepository.fetchNewsChannelHeadlinesApi(name);
      return response;
    } catch (e) {
      print('Error fetching news channel headlines: $e');
      rethrow;
    }
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    try {
      final response = await _newsRepository.fetchCategoriesNewsApi(category);
      return response;
    } catch (e) {
      print('Error fetching categories news: $e');
      rethrow;
    }
  }
}
