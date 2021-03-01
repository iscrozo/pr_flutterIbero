import 'package:app1/model/news.dart';
import 'package:app1/view/widgets/news_card.dart';
import 'package:flutter/material.dart';

class buildItemList extends StatelessWidget {
  final News snapshotData;
  final Function(News) onTapFav;
  buildItemList({
    Key key,
    @required this.snapshotData,
    this.onTapFav,
  });

  @override
  Widget build(BuildContext context) {
    return NewsCard(
      snapshotData: snapshotData,
      onTapFav: onTapFav,
    );
  }
}
