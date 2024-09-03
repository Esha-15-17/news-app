import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_news_app/models/categories_new_model.dart';
import 'package:my_news_app/models/news_channel_headlines_model.dart';

class NewsRepository {
  Future<NewschannelsHeadlinesModel> fetchNewsChannelHeadlinesApi(String name) async {
    String apiKey = '0d83c2a78fc842bfaa5868ded408c3fe'; // Replace with your actual API key
    String url = 'https://newsapi.org/v2/top-headlines?sources=$name&apiKey=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print('URL: $url');
      print('Response: ${response.body}');
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewschannelsHeadlinesModel.fromJson(body);
    }
    throw Exception('Error fetching news');
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    String apiKey = '0d83c2a78fc842bfaa5868ded408c3fe'; // Replace with your actual API key
    String url = 'https://newsapi.org/v2/everything?q=$category&apiKey=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print('URL: $url');
      print('Response: ${response.body}');
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Error fetching news');
  }
}
