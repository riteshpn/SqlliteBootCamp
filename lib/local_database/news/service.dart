// import 'dart:convert';

// import 'news_models_class.dart';

// class NewsService {
//   final String url = 'https://newsapi.org/v2/top-headlines?country=us&category=business';

//   Future<NewsResponse> fetchNews() async {
//     final apiKey = dotenv.env['NEWS_API_KEY'];  

//     final response = await http.get(Uri.parse('$url&apiKey=$apiKey'));

//     if (response.statusCode == 200) {
//       return NewsResponse.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }
// }
