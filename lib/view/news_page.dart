import 'package:app1/presenter/build_view.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int Newsint = 1;

  String viewName = 'NewsList';

  listTileWidget(asTitle) => ListTile(
        title: Text(asTitle),
        leading: Icon(Icons.my_library_books),
        dense: true,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'BIT News',
          style: TextStyle(color: Colors.black26),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.favorite),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Image.network(
                  'https://bit.institute/images/Instituto-Cursos-Programacion.png'),
            )),
            InkWell(
              onTap: () {
                setState(() {
                  Newsint = 1;
                  viewName = 'NewsList';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: listTileWidget(
                    '> All articles about Tesla from the last month, sorted by recent first'),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Newsint = 2;
                  viewName = 'NewsList';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: listTileWidget(
                  '> Top business headlines in the US right now',
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Newsint = 3;
                  viewName = 'NewsList';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: listTileWidget(
                  '> All articles mentioning Apple from yesterday, sorted by popular publishers first',
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Newsint = 4;
                  viewName = 'NewsList';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: listTileWidget(
                  '> Top headlines from TechCrunch right now',
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Newsint = 5;
                  viewName = 'NewsList';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: listTileWidget(
                  '> All articles published by the Wall Street Journal in the last 6 months, sorted by recent first',
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: BuildView(viewName: viewName, intNews: Newsint),
      ),
    );
  }
}
