import 'package:app1/presenter/build_view.dart';
import 'package:app1/util/firebaseController.dart' as firebaseControl;
import 'package:app1/view/widgets/drawer_option.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  User user;
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int Newsint = 1;
  User user;

  String viewName = 'NewsList';
  static const drawerOptions = <Map<String, dynamic>>[
    {
      'value': 1,
      'text':
          'All articles about Tesla from the last month, sorted by recent first',
      'icon': Icon(Icons.description)
    },
    {
      'value': 2,
      'text': 'Top business headlines in the US right now',
      'icon': Icon(Icons.description)
    },
    {
      'value': 3,
      'text':
          'All articles mentioning Apple from yesterday, sorted by popular publishers first',
      'icon': Icon(Icons.description)
    },
    {
      'value': 4,
      'text': 'Top headlines from TechCrunch right now',
      'icon': Icon(Icons.description)
    },
    {
      'value': 5,
      'text':
          'All articles published by the Wall Street Journal in the last 6 months, sorted by recent first',
      'icon': Icon(Icons.description)
    },
  ];

  @override
  void initState() {}

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
            child: Row(
              children: [
                Icon(Icons.favorite),
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.black26,
                Colors.black12,
                Colors.white70
              ])),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/img/user.png"),
                      ),
                      Text('')
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.black26,
                Colors.black12,
                Colors.white70
              ])),
              child: Text(
                "News",
                textAlign: TextAlign.left,
              ),
            ),
            ...drawerOptions
                .map((option) => DrawerOption(
                      text: option['text'],
                      addIcon: option['icon'],
                      onTap: () {
                        setState(() {
                          Newsint = option['value'];
                          Navigator.pop(context);
                        });
                      },
                    ))
                .toList(),
            Divider(),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.black26,
                Colors.black12,
                Colors.white70
              ])),
              child: Text(
                "Settings",
                textAlign: TextAlign.left,
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sign Out"),
              onTap: () {
                firebaseControl.signOut();
                Navigator.pushNamed(context, '/login');
              },
            )
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
