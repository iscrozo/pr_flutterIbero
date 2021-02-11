import 'package:app1/model/news.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(news.image),
          Text(news.title),
          Text(news.author)
        ],
      ),
    );
  }
}
