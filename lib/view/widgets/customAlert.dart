import 'package:flutter/material.dart';

Widget DialogCustom = AlertDialog(
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
            margin: EdgeInsets.only(top: 22),
            height: 100,
            width: 60,
            padding: EdgeInsets.all(10),
            child: Image(image: AssetImage("assets/img/warning.png"))),
        Container(
          padding: EdgeInsets.all(0.3),
// width: 100,
          child: Column(
            children: [
              Text(
                "Alert!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Please fill in the fields \n before continuing",
                  textAlign: TextAlign.justify,
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
// DialogButton(
//   text: 'OK !',
//   addColors: btnVerde,
//   addBackground:
//       Colors.white,
//   onPressed: () {
//     Navigator.of(context)
//         .pop();
//   },
// )
  ],
);
//
// Widget customDialogAnimation =
//     showGeneralDialog(context: null, pageBuilder: null);

Widget dialogCustom1 = AlertDialog(
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
            margin: EdgeInsets.only(top: 22),
            height: 100,
            width: 60,
            padding: EdgeInsets.all(10),
            child: Image(image: AssetImage("assets/img/warning.png"))),
        Container(
          padding: EdgeInsets.all(0.3),
// width: 100,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Loading",
                  textAlign: TextAlign.justify,
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
// )
  ],
);
