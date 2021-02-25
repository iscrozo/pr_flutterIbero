import 'package:app1/data/apiService.dart';
import 'package:app1/presenter/build_itemList.dart';
import 'package:app1/util/colors.dart';
import 'package:app1/view/widgets/dialog_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildView extends StatelessWidget {
  final String viewName;
  final int intNews;

  BuildView({@required this.viewName, @required this.intNews});

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
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              bottomLeft: Radius.circular(25),
                                              bottomRight: Radius.circular(25)),
                                        ),
                                        content: Container(
                                          height: 75,
                                          child: Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 22),
                                                height: 50,
                                                width: 50,
                                                child: CircleAvatar(
                                                  radius: 72.0,
                                                  backgroundColor: Colors.white,
                                                  backgroundImage: AssetImage(
                                                      "assets/img/addFav.png"),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(0.3),
                                                // width: 100,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Alert!",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10),
                                                      child: Text(
                                                        "Are you sure to add this news \n to favorite list?",
                                                        textAlign:
                                                            TextAlign.justify,
                                                        maxLines: 2,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          DialogButton(
                                            text: 'NO',
                                            addColors: btnRojo,
                                            addBackground: Colors.white,
                                            onPressed: () => {
                                              // Navigator.pop(context)
                                            },
                                          ),
                                          DialogButton(
                                            text: 'YES',
                                            addColors: btnVerde,
                                            addBackground: Colors.white,
                                            onPressed: () {},
                                          )
                                        ],
                                      ));
                            },
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Container();
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ),
        );
      case 'FavoriteList':
        return Container();
    }
  }
}
