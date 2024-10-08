import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_responsive/list_map_provider.dart';
import 'package:widgets_responsive/local_database/product_local/product_add_screen.dart';
import 'package:widgets_responsive/provider_class.dart';
import 'package:widgets_responsive/provider_theme.dart';

void main() {
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
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
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
        home: ProductAddScreen());
  }
}
