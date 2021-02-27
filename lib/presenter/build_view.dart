import 'package:app1/data/apiService.dart';
import 'package:app1/presenter/build_itemList.dart';
import 'package:app1/view/widgets/loadingCustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildView extends StatelessWidget {
  final String viewName;
  final int intNews;

  BuildView({
    @required this.viewName,
    @required this.intNews,
  });

  @override
  Widget build(BuildContext context) {
    switch (viewName) {
      case 'NewsList':
        return Container(
          child: Center(
            child: Container(
              child: FutureBuilder(
                  future: ApiService().GetDio(optionUrl: intNews),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: (snapshot.data).articlesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildItemList(
                            snapshotData: (snapshot.data).articlesList[index],
                            onTapFav: (news) {
                              final snackBar = SnackBar(
                                content: Text('New Add'),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            loadingSquare,
                            Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Text("sorry, network problems"))
                          ],
                        ),
                      );
                    }

                    return Center(child: loadingSquare);
                  }),
            ),
          ),
        );
      case 'FavoriteList':
        return Container();
    }
  }
}
