import 'package:flutter/material.dart';
import 'package:fluttereasypay/success.dart';


import 'checkout.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => Checkout());
      case '/checkout':
        return MaterialPageRoute(builder: (_) => Checkout());
      case '/success':
        if(args is String){
          return MaterialPageRoute(
              builder: (_) => Success(response: args)
          );
        }

        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}