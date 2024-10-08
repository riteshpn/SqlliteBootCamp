import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:widgets_responsive/local_database/news/model.dart';

class NewsService {
  final String apiKey = '6f2aa238774e45e1b664e0abfca605de';
  final String url ='https://newsapi.org/v2/top-headlines?country=us&category=business';

  Future<NewsModel> fetchNews() async {
    final response = await http.get(
      Uri.parse('$url&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      print("Raw JSON data: $jsonData");

      final newsModel = NewsModel.fromJson(jsonData);
      print("Parsed NewsModel: $newsModel");

      return newsModel;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
