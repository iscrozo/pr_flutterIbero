import 'package:app1/util/colors.dart';
import 'package:app1/util/firebaseController.dart' as firebaseControl;
import 'package:app1/util/resize.dart';
import 'package:app1/view/widgets/app_button.dart';
import 'package:app1/view/widgets/app_text_field.dart';
import 'package:app1/view/widgets/showMessageNotify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/colors.dart';
import '../util/styles.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controllers
  TextEditingController _textEditingControllerEmail =
      new TextEditingController();
  TextEditingController _textEditingControllerPassword =
      new TextEditingController();
  // variables
  bool gbButtonLogin = false;

  /// estado inicial de la app
  @override
  void initState() {
    Initialing();
  }

  /// Metodo que inicializa
  void Initialing() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    var _Height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        // resizeToAvoidBottomInset: false,
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
                    ColorFilter.mode(Colors.white, BlendMode.softLight),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: colorBlanco.withAlpha(100),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    //top: 40,
                    top: ResizeH(_Height, 40),
                    left: 25,
                    right: 25),
                height: _Height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 15,
                    ),
                  ],
                  color: colorBlanco,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(130),
                    bottomRight: Radius.circular(130),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to",
                      style: GoogleFonts.signika(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: ResizeH(
                          _Height,
                          20,
                        ),
                      ),
                    ),
                    Image.asset('assets/img/BitLogo.png',
                        width: ResizeH(_Height, 157),
                        height: ResizeH(_Height, 63),
                        fit: BoxFit.contain),
                    Text(
                      'Please login to continue',
                      style: GoogleFonts.signika(
                        fontSize: ResizeH(_Height, 20),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AppTextField(
                        aobController: _textEditingControllerEmail,
                        hintText: 'email',
                        icon: Icon(
                          Icons.alternate_email,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _Height * 0.02,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: AppTextField(
                          aobController: _textEditingControllerPassword,
                          hintText: 'Password',
                          icon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          obscureText: true,
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot password',
                        )),
                    SizedBox(
                      height: _Height * 0.05,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            print("onclick button");
                            setState(() {
                              gbButtonLogin = !gbButtonLogin;
                              if (_textEditingControllerPassword.text.isEmpty ||
                                  _textEditingControllerEmail.text.isEmpty) {
                                // print("fills emptys");
                                gbButtonLogin = !gbButtonLogin;
                                showToastMessage(
                                    aobContext: context,
                                    asMessage:
                                        'Please fill in the fields before continuing');
                              } else {
                                // print("Fields full");
                                gbButtonLogin = !gbButtonLogin;
                                firebaseControl.signIn(
                                  email: _textEditingControllerEmail.text,
                                  password: _textEditingControllerPassword.text,
                                  context: context,
                                );
                                firebaseControl.stateChanges(context);
                              }
                            });
                          },
                          hoverColor: Colors.red,
                          focusColor: Colors.red,
                          child: Container(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              margin: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(90)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      spreadRadius: 1,
                                      blurRadius: 12)
                                ],
                              ),
                              child: Center(
                                  child: gbButtonLogin != true
                                      ? Text("Login",
                                          style: GoogleFonts.signika(
                                              fontSize: 18,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold))
                                      : CircularProgressIndicator())),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 500,
                child: SizedBox(),
              ),
              Text(
                'OR',
                style: Styles.secondaryTextStyle,
              ),
              Expanded(
                flex: 1000,
                child: SizedBox(),
              ),
              AppButton(
                text: 'SING UP',
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
              ),
              Expanded(
                flex: 1000,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
