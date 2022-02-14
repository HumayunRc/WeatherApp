import 'package:flutter/material.dart';
import 'package:weather/screens/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/utilities/contants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  WeatherModel weatherModel = WeatherModel();
  void getLocationData() async {
    var weatherData = await weatherModel.getLocationData();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return HomeScreen(locationWeather: weatherData);
      }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: Colors.white,
              size: 100,
              duration: Duration(seconds: 2),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Keep Location is On!',
              style: kHeadingthree,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 15, right: 30),
        child: SizedBox.fromSize(
          size: Size.square(65),
          child: FloatingActionButton(
            elevation: 10,
            onPressed: () {
              getLocationData();
            },
            child: Icon(
              Icons.my_location_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
