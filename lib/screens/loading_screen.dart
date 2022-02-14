import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather/screens/splash_screen.dart';
import 'package:weather/utilities/contants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Image.asset(
                'assets/images/16.png',
                alignment: Alignment.topCenter,
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15,
                  sigmaY: 20,
                ),
                child: Container(
                  color: Color(0xe60B0C1E),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/16.png',
                    width: 200,
                  ),
                  Text(
                    'Discover the Weather in Your City',
                    style: kHedingtwo,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Get to know your weather maps and radar precipetation forecast',
                    style: kBodyText,
                    textAlign: TextAlign.center,
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashScreen()));
                    },
                    child: Text(
                      'Get Start',
                      style: kButtonText,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    fillColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
