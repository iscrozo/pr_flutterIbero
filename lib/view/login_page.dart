import 'package:app1/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:app1/util/colors.dart';
import 'package:app1/util/resize.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var _Height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/backbit.png'),
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.softLight))),
          ),
          Container(
            padding: EdgeInsets.only(
                //top: 40,
                top: ResizeH(_Height, 40),
                left: 25,
                right: 25),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: colorAzulClaro,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                    bottomRight: Radius.circular(90))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome to",
                    style: GoogleFonts.signika(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: ResizeH(_Height, 20))),
                Image.asset(
                  'assets/img/BitLogo.png',
                  width: ResizeH(_Height, 157),
                  height: ResizeH(_Height, 63),
                  fit: BoxFit.contain,
                ),
                Text(
                  'Please login to continue',
                  style: GoogleFonts.signika(
                      fontSize: ResizeH(_Height, 20),
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text("Example",
                style: Styles.primaryTextStyle,)

              ],
            ),
          ),
        ],
      ),
    ));
  }
}
