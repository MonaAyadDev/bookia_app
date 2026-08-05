import 'package:bookia_app/core/Routes/routes.dart';
import 'package:bookia_app/features/auth/presentation/screens/login_screen.dart';
import 'package:bookia_app/features/auth/presentation/screens/register_screen.dart';
import 'package:bookia_app/features/start/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('404 ')],
            ),
          ),
        );
    }
  }
}
