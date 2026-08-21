import 'package:bookia_app/core/Routes/routes.dart';
import 'package:bookia_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_app/features/auth/presentation/screens/create_new_password.dart';
import 'package:bookia_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:bookia_app/features/auth/presentation/screens/login_screen.dart';
import 'package:bookia_app/features/auth/presentation/screens/otp_verification.dart';
import 'package:bookia_app/features/auth/presentation/screens/password_changed_screen.dart';
import 'package:bookia_app/features/auth/presentation/screens/register_screen.dart';
import 'package:bookia_app/features/home/presentation/screens/home_screen.dart';
import 'package:bookia_app/features/main/main_screen.dart';
import 'package:bookia_app/features/start/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: LoginScreen(),
          ),
        );
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: MainScreen(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: RegisterScreen(),
          ),
        );
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: ForgotPasswordScreen(),
          ),
        );
      case Routes.otpForgetPasswordScreen:
        return MaterialPageRoute(builder: (context) => OtpVerificationScreen());
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => CreateNewPasswordScreen(),
        );
      case Routes.passwordChengedScreen:
        return MaterialPageRoute(builder: (context) => PasswordChangedScreen());
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
