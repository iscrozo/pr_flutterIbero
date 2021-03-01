// Import the firebase_core plugin
import 'package:app1/view/widgets/showMessageNotify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// Metodo del estado de login en firebase
void stateChanges(context) {
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      print('User is currently signed out!');
      // String messages1 = 'Unregistered user';
      // showToastMessage(aobContext: context, asMessage: messages1);
    } else {
      print('User is signed in!');

      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushNamed(context, '/news', arguments: user);
      });
    }
  });
}

/// Metodo de autenticacion con firebase
///
void signIn({@required email, @required password, @required context}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      String messagesignIn1 = 'No user found for that email.';
      print(messagesignIn1);
      showToastMessage(aobContext: context, asMessage: messagesignIn1);
    } else if (e.code == 'wrong-password') {
      String messagesignIn2 = 'Wrong password provided for that user.';
      print(messagesignIn2);
      showToastMessage(aobContext: context, asMessage: messagesignIn2);
    }
  }
}

@override
Widget build(BuildContext context) {
  return Container();
}

/// metodo de registro de usuario en firebase
///
void registerUser(
    {@required String asEmail,
    @required String asPassword,
    @required aobContext}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: asEmail, password: asPassword);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

/// Metodo de cierre de sesion en firebase
///
void signOut() async {
  await FirebaseAuth.instance.signOut();
}
