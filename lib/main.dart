import 'package:flutter/material.dart';
import 'package:weather/screens/splash_screen.dart';
import 'package:weather/screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff0B0C1E),
        fontFamily: 'SFPro',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/splash_screen': (context) => SplashScreen(),
      },
    );
  }
}
