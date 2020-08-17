import 'package:flutter/material.dart';
import 'package:sapientia/utilities/constants.dart';
import 'package:sapientia/utilities/route-generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sapientia',
      theme: ThemeData(
        canvasColor: colorWhite,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splashscreen',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
