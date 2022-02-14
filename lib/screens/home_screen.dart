import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/screens/city_screen.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/utilities/contants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.locationWeather});
  final locationWeather;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel weatherModel = WeatherModel();
  late int temp;
  late String weatherText;
  late String iconUrl;
  late String cityName;
  late int humidity;
  late double windSpeed;
  late int clouds;

  void updateUi(dynamic weatherData) {
    double tempDouble = weatherData['main']['temp'];
    temp = tempDouble.toInt();
    int condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    humidity = weatherData['main']['humidity'];
    double wind = weatherData['wind']['speed'];
    windSpeed = double.parse(wind.toStringAsFixed(2));
    clouds = weatherData['clouds']['all'];
    weatherText = weatherModel.weatherText(condition);
    iconUrl = weatherModel.weatherIcon(condition);
  }

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

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
                'assets/images/8.png',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Weather Of',
                            style: kHeadingthree,
                          ),
                          Text(
                            '$cityName',
                            style: kHedingtwoBlue,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    iconUrl,
                    width: 135,
                  ),
                  Text(
                    weatherText,
                    style: kHedingtwoBlue,
                  ),
                  Text(
                    '$temp\u2070c',
                    style: kHedingone,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ImageIcon(
                        imgurl: 'assets/images/4.png',
                        reportDetails: '$windSpeed m/s',
                        reportName: 'Wind',
                      ),
                      ImageIcon(
                        imgurl: 'assets/images/39.png',
                        reportDetails: '$humidity%',
                        reportName: 'Humidity',
                      ),
                      ImageIcon(
                        imgurl: 'assets/images/35.png',
                        reportDetails: '$clouds%',
                        reportName: 'Cloudiness',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox.fromSize(
                        size: Size.square(50),
                        child: RawMaterialButton(
                          onPressed: () async {
                            var weatherData =
                                await weatherModel.getLocationData();
                            setState(() {
                              updateUi(weatherData);
                            });
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Icon(
                            Icons.my_location_rounded,
                            color: Colors.white,
                          ),
                          fillColor: Colors.blue,
                          shape: CircleBorder(),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RawMaterialButton(
                        onPressed: () async {
                          var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CityScreen();
                              },
                            ),
                          );
                          var weatherData =
                              await weatherModel.getCityWeather(typedName);
                          setState(() {
                            updateUi(weatherData);
                          });
                        },
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Search by City',
                              style: kBodyText,
                            ),
                          ],
                        ),
                        fillColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageIcon extends StatelessWidget {
  ImageIcon(
      {Key? key,
      required this.imgurl,
      required this.reportName,
      required this.reportDetails})
      : super(key: key);
  String imgurl;
  String reportName;
  String reportDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imgurl,
          width: 60,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          reportDetails,
          style: kBodyText,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          reportName,
          style: kBodyTextsml,
        )
      ],
    );
  }
}
