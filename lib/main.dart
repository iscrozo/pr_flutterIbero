import 'package:app1/view/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// clase principal
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => new LoginPage());
          default:
            return null;
        }
      },
    );
  }
}
