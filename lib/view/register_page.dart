import 'package:app1/util/firebaseController.dart' as firebaseControl;
import 'package:app1/view/widgets/loadingCustom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: EdgeInsets.only(top: 40, left: 25, right: 25),
            height: MediaQuery.of(context).size.height / 1.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              height: 100,
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: Image.asset(
                    'assets/img/BitLogo.png',
                    alignment: Alignment.center,
                    width: 140,
                    height: 53,
                    fit: BoxFit.contain,
                  )),

                  Divider(color: Colors.transparent, height: 30),

                  Text('Create your account',
                      style: GoogleFonts.signika(
                          fontSize: 20,
                          color: Color(0xFF636363),
                          fontWeight: FontWeight.normal)),

                  Divider(color: Colors.transparent, height: 20),

                  //Email Field
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(90)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2,
                              blurRadius: 5)
                        ],
                      ),
                      child: TextField(
                        controller: _textEditingControllerEmail,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: GoogleFonts.signika(
                              fontSize: 18,
                              color: Colors.black45,
                              fontWeight: FontWeight.normal),
                          icon: Icon(Icons.email),
                        ),
                      ),
                    ),
                  ),

                  //Password Field
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(90)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2,
                              blurRadius: 5)
                        ],
                      ),
                      child: TextField(
                        obscureText: eyePass == false ? true : false,
                        controller: _textEditingControllerPassword,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: GoogleFonts.signika(
                                fontSize: 18,
                                color: Colors.black45,
                                fontWeight: FontWeight.normal),
                            icon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(eyePass == false
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined),
                              onPressed: () {
                                setState(() {
                                  eyePass = !eyePass;
                                });
                              },
                            )),
                      ),
                    ),
                  ),

                  //Sign Up Button
                  Center(
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            //LogButton = !LogButton;
                            firebaseControl.registerUser(
                              asEmail: _textEditingControllerEmail.text,
                              asPassword: _textEditingControllerPassword.text,
                              aobContext: context,
                            );
                            firebaseControl.stateChanges(context);
                          });
                        },
                        hoverColor: Colors.red,
                        focusColor: Colors.red,
                        child: Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          margin: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(90)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 12)
                            ],
                          ),
                          child: Center(
                              child: gbButtonLogin != true
                                  ? Text("Sign Up",
                                      style: GoogleFonts.signika(
                                          fontSize: 18,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold))
                                  : loadingSquare),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
