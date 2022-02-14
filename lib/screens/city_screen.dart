import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/utilities/contants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xe60B0C1E),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 70,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/images/search.png',
                    ),
                  ),
                  Text(
                    'Find Weather of any City',
                    style: kTextblue,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        'Enter City Name:',
                        style: kBodyText,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'City Name',
                      hintStyle: TextStyle(color: Colors.black45),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, cityName);
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15))),
                        child: Text(
                          'Get Weather',
                          style: kBodyText,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Back',
                          style: kBodyText,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
