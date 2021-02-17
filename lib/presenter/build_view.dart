import 'package:app1/data/apiService.dart';
import 'package:app1/presenter/build_itemList.dart';
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
                              snapshotData:
                                  (snapshot.data).articlesList[index]);
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width / 2,
                        height: 120,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.wifi_off_outlined,
                              color: Colors.redAccent,
                              size: 40.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                "Upps! lo sentimos \n Tenemos un problema",
                              ),
                            )
                          ],
                        ),
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(
                        value: 10.0,
                        strokeWidth: 10,
                        backgroundColor: Colors.cyanAccent,
                      ),
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
