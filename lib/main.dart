import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_responsive/list_map_provider.dart';
import 'package:widgets_responsive/local_database/news/api/news_api_class.dart';
import 'package:widgets_responsive/local_database/news/news_list_screen.dart';
import 'package:widgets_responsive/local_database/news/news_view_model.dart';
import 'package:widgets_responsive/provider_class.dart';
import 'package:widgets_responsive/provider_theme.dart';

void main() async {
  final newsService = NewsService();
  try {
    final news = await newsService.fetchNews();
    print("Final NewsModel returned: $news");
  } catch (e) {
    print('Error: $e');
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ListMapProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderTheme(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => NewsProvider(),
        // )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    NewsViewModel newsList = NewsViewModel();
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: context.watch<ProviderTheme>().getThemeValue()
          ? ThemeMode.dark
          : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NewsScreen(newsData: newsList.newsData),
    );
  }
}
