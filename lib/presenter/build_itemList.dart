import 'package:app1/model/news.dart';
import 'package:app1/view/widgets/news_card.dart';
import 'package:flutter/material.dart';

class buildItemList extends StatelessWidget {
  final News snapshotData;

  buildItemList({Key key, @required this.snapshotData});

  @override
  Widget build(BuildContext context) {
    return NewsCard(news: snapshotData,);
  }
}
