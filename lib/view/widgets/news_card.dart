import 'package:app1/model/news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard extends StatelessWidget {
  final News snapshotData;

  final Function(News) onTapFav;

  NewsCard({Key key, @required this.snapshotData, this.onTapFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widget;
    return Container(
      width: 344,
      height: MediaQuery.of(context).size.height / 1.72,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.black12)
          ]),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: snapshotData.urlToImage != null
                        ? NetworkImage(snapshotData.urlToImage)
                        : AssetImage('assets/img/backbit.png'))),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(snapshotData.title ?? 'Title not find',
                      maxLines: 3,
                      style: GoogleFonts.signika(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text(snapshotData.author ?? 'Author not find',
                      style: GoogleFonts.signika(
                          fontSize: 14,
                          color: Colors.black45,
                          fontWeight: FontWeight.normal)),
                  Container(
                    height: 10,
                  ),
                  Text(snapshotData.description ?? 'Description not find',
                      maxLines: 3,
                      style: GoogleFonts.signika(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 13, left: 13),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(!true
                          ? Icons.favorite_border_outlined
                          : Icons.favorite),
                      onPressed: () {
                        onTapFav(snapshotData);
                      }),
                  InkWell(
                      onTap: () => Navigator.pushNamed(context, '/view',
                          arguments: snapshotData),
                      child: Row(
                        children: [
                          Icon(Icons.input_sharp),
                          Text(
                            'VIEW MORE',
                            style: GoogleFonts.signika(
                                fontSize: 14,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
