import 'package:flutter/material.dart';
import 'package:widgets_responsive/local_database/news/news_models_class.dart';
import 'package:widgets_responsive/local_database/news/news_static_string.dart';
import 'package:widgets_responsive/local_database/news/widget/custom_appbar.dart';
import 'package:widgets_responsive/local_database/news/widget/custom_size_box.dart';

import 'widget/news_textstyle.dart';

class NewsScreen extends StatelessWidget {
  final List<NewsDomainModel> newsData;

  const NewsScreen({Key? key, required this.newsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: NewsTitle.newsTitleName,
      ),
      body: ListView.builder(
        itemCount: newsData.length,
        itemBuilder: (context, index) {
          final news = newsData[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Card(
              color: Colors.black,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        news.title,
                        style: TextStyle(
                          fontWeight: TextStyleType.titleStyle.getFontWeight,
                          fontSize: TextStyleType.titleStyle.getFontsize,
                          color: TextStyleType.titleStyle.getFontcolor,
                        ),
                      ),
                    ),
                    const CustomSizedBox.h8(),
                    Text(
                      news.subtitle,
                      style: TextStyle(
                        fontWeight: TextStyleType.subtitleStyle.getFontWeight,
                        fontSize: TextStyleType.subtitleStyle.getFontsize,
                        color: TextStyleType.subtitleStyle.getFontcolor,
                      ),
                    ),
                    const CustomSizedBox.h4(),
                    Text(
                      news.description,
                      style: TextStyle(
                        fontWeight:
                            TextStyleType.descriptionStyle.getFontWeight,
                        fontSize: TextStyleType.descriptionStyle.getFontsize,
                        color: TextStyleType.descriptionStyle.getFontcolor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
