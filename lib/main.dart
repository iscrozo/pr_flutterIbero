import 'package:app1/util/strings.dart';
import 'package:app1/view/login_page.dart';
import 'package:app1/view/news_page.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: screeHome(),
  ));
}

/**
 * Clase principal
 */
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/news',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => new LoginPage());
          case '/news':
            return MaterialPageRoute(builder: (context) => new NewsPage());
          default:
            return null;
        }
      },
    );
  }
}

/**
 * Clase para la animacion inicial de la app
 */
class screeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      imageSrc: "assets/gif/reading.gif",
      home: MyApp(),
      duration: 6000,
      imageSize: 450,
      text: gsMessageLoading,
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
