// // news_controller.dart
// import 'package:flutter/material.dart';
// import 'package:widgets_responsive/local_database/news/news_models_class.dart';
// import 'package:widgets_responsive/local_database/news/service.dart';


// class NewsController extends ChangeNotifier {
//   final NewsService _newsService = NewsService();
//   List<Article> articles = [];
//   bool isLoading = false;

//   Future<void> fetchArticles() async {
//     isLoading = true;
//     notifyListeners();
//     try {
//       NewsResponse newsResponse = await _newsService.fetchNews();
//       articles = newsResponse.articles;
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }
