import 'package:app1/model/news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewPage extends StatefulWidget {
  News arguments;

  ViewPage(this.arguments);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    dynamic HeightPX = MediaQuery.of(context).size.height;
    dynamic WidthPX = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60),
        padding: EdgeInsets.only(
          left: 25,
          right: 25
        ),
        width: WidthPX,
        height: HeightPX,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40, left: 25, right: 25),
              height: HeightPX / 2.5,
              width: WidthPX,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: widget.arguments.urlToImage != null
                        ? NetworkImage(widget.arguments.urlToImage)
                        : AssetImage('assets/img/backbit.png')),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45, spreadRadius: 9, blurRadius: 12)
                ],
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(widget.arguments.title ?? 'Title not find',
                      maxLines: 3,
                      style: GoogleFonts.signika(
                          fontSize: 20,
                          color: Colors.black45,
                          fontWeight: FontWeight.normal)),
                  Container(
                    height: HeightPX / 40,
                  ),
                  Text(widget.arguments.content ?? 'Content not find',
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.fade,
                      maxLines: 4,
                      style: GoogleFonts.signika(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
