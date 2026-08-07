import 'package:bookia_app/core/Routes/routes.dart';
import 'package:bookia_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:bookia_app/features/auth/presentation/cubit/register_cubit.dart';
import 'package:bookia_app/features/auth/presentation/screens/login_screen.dart';
import 'package:bookia_app/features/auth/presentation/screens/register_screen.dart';
import 'package:bookia_app/features/home/presentation/screens/home_screen.dart';
import 'package:bookia_app/features/start/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginScreen(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: RegisterScreen(),
          ),
        );
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
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
