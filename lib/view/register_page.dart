import 'package:app1/util/colors.dart';
import 'package:app1/util/firebaseController.dart' as firebaseControl;
import 'package:app1/util/styles.dart';
import 'package:app1/view/widgets/app_text_field.dart';
import 'package:app1/view/widgets/dialog_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // variables
  bool gbButtonLogin = false;
  bool eyePass = false;
  // Controllers
  TextEditingController _textEditingControllerEmail =
      new TextEditingController();
  TextEditingController _textEditingControllerPassword =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _Height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    double ldCurvaturax = 500;
    double ldCurvaturay = 100;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                // contenedor con curva inferior - color blanco
                Container(
                    height: MediaQuery.of(context).size.height / 1.35,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 15,
                        )
                      ],
                      color: colorBlanco,
                      borderRadius: BorderRadius.only(
                        bottomRight:
                            Radius.elliptical(ldCurvaturax, ldCurvaturay),
                        bottomLeft:
                            Radius.elliptical(ldCurvaturax, ldCurvaturay),
                      ),
                    ),
                    // Formulario
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          margin: EdgeInsets.only(top: 50),
                          width: MediaQuery.of(context).size.width / 1.25,
                          height: MediaQuery.of(context).size.height / 2.2,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 65.0,
                            right: 65.0,
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 45),
                                child: Text(
                                  "Register",
                                  style: Styles.labelTextStyle3,
                                ),
                              ),
                              Container(
                                width: 80,
                                height: 80,
                                padding: EdgeInsets.all(3),
                                margin: EdgeInsets.only(top: 50),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colorBlanco,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ]),
                                child: CircleAvatar(
                                  radius: 72.0,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage("assets/img/user.png"),
                                ),
                              ),
                              SizedBox(
                                height: _Height * 0.05,
                              ),
                              Align(
                                alignment: Alignment.center,
                                // textFiel de email
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
                                height: _Height * 0.012,
                              ),
                              Align(
                                alignment: Alignment.center,
                                // textFiel de contraseña
                                child: AppTextField(
                                  aobController: _textEditingControllerPassword,
                                  hintText: 'Password',
                                  icon: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                  obscureText: true,
                                ),
                              ),
                              SizedBox(
                                height: _Height * 0.192,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      print("onclick button");
                                      setState(() {
                                        gbButtonLogin = !gbButtonLogin;
                                        if (_textEditingControllerPassword
                                                .text.isEmpty ||
                                            _textEditingControllerEmail
                                                .text.isEmpty) {
                                          // print("fills emptys");
                                          gbButtonLogin = !gbButtonLogin;
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(25),
                                                              bottomLeft: Radius
                                                                  .circular(25),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          25)),
                                                    ),
                                                    content: Container(
                                                      height: 75,
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 22),
                                                              height: 100,
                                                              width: 60,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              child: Image(
                                                                  image: AssetImage(
                                                                      "assets/img/warning.png"))),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0.3),
                                                            // width: 100,
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  "Alert!",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10),
                                                                  child: Text(
                                                                    "Please fill in the fields \n before continuing",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
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
                                                        text: 'OK !',
                                                        addColors: btnVerde,
                                                        addBackground:
                                                            Colors.white,
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      )
                                                    ],
                                                  ));
                                        } else {
                                          // print("Fields full");
                                          gbButtonLogin = !gbButtonLogin;
                                          firebaseControl.registerUser(
                                            asEmail: _textEditingControllerEmail
                                                .text,
                                            asPassword:
                                                _textEditingControllerPassword
                                                    .text,
                                            aobContext: context,
                                          );
                                          firebaseControl.stateChanges(context);
                                        }
                                      });
                                    },
                                    child: Container(
                                        height: 35,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            color: backgroundColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3),
                                              ),
                                            ]),
                                        child: Center(
                                            child: gbButtonLogin != true
                                                ? Text(
                                                    'Sing up',
                                                    style: TextStyle(
                                                        color: colorBlanco),
                                                  )
                                                : CircularProgressIndicator())),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Expanded(
                  flex: 500,
                  child: SizedBox(),
                ),

                Expanded(
                  flex: 1000,
                  child: SizedBox(),
                ),

                Expanded(
                  flex: 1000,
                  child: SizedBox(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
