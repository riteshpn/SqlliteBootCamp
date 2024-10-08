// // news_detail_screen.dart
// import 'package:flutter/material.dart';
// import 'package:widgets_responsive/local_database/news/news_models_class.dart';

// class NewsDetailScreen extends StatelessWidget {
//   final Article article;

//   NewsDetailScreen({required this.article});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Article Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (article.urlToImage != null)
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   article.urlToImage!,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                   height: 200,
//                 ),
//               ),
//             SizedBox(height: 16),
//             Text(
//               article.title ?? 'No Title',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'By ${article.author ?? "Unknown Author"}',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             SizedBox(height: 16),
//             Text(
//               article.description ?? 'No Description',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 24),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // _launchURL(article.url);
//                   },
//                   child: Text('Read Full Article'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // void _launchURL(String url) async {
//   //   if (await canLaunch(url)) {
//   //     await launch(url);
//   //   } else {
//   //     throw 'Could not launch $url';
//   //   }
//   // }
// }
