import 'package:app1/data/apiService.dart';
import 'package:flutter/material.dart';
import 'package:app1/presenter/build_itemList.dart';
class BuildView extends StatelessWidget {
  final String viewName;
  final int intNews;


  BuildView({@required this.viewName, @required this.intNews});

  @override
  Widget build(BuildContext context) {
    switch(viewName){
      case 'NewsList':
        return Container(
          child: Center(
            child: Container(
              child: FutureBuilder(
                future: ApiService().GetDio(optionUrl: intNews),
                  builder: (context, snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: (snapshot.data).articlesList.length,
                      itemBuilder: (BuildContext context, int index){
                        return buildItemList(snapshotData: (snapshot.data).articlesList[index]);
                      },
                    );
                  }else if(snapshot.hasError){
                    return Container();
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  }
              ),
            ),
          ),
        );
      case 'FavoriteList':
        return Container();
    }
  }
}
