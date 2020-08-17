import 'package:flutter/material.dart';
import 'package:sapientia/screens/headlines.dart';
import 'package:sapientia/screens/splash-screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/splashscreen':
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case '/headlines':
        return MaterialPageRoute(
          builder: (_) => Headlines(),
        );

      default:
        return _errorRoute();
    } //switch
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error Page'),
        ),
        body: Center(
          child: Text('AN ERROR HAS OCCURED!'),
        ),
      );
    });
  } //error ROUTE
} //end RouteGenerator
