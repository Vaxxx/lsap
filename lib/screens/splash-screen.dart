import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sapientia/screens/home-page.dart';
import 'package:sapientia/utilities/constants.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      navigateToHome();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorWhite,
      body: Container(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Shimmer.fromColors(
                  child: Container(
                    child: Text(
                      'Sapientia',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 80.0,
                          fontFamily: 'Pacifico',
                          fontWeight: FontWeight.w800,
                          shadows: <Shadow>[
                            Shadow(
                                blurRadius: 20.0,
                                color: colorWhite,
                                offset: Offset.fromDirection(120, 12))
                          ]),
                    ),
                  ),
                  baseColor: colorWhite,
                  highlightColor: googleColor),
            ),
            SizedBox(
              height: 40,
            ),
            Center(child: transparentLogo)
          ],
        ),
      ),
    );
  }

  void navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }
}
