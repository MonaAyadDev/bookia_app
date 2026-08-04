import 'package:bookia_app/the_root/bookia_app.dart';
import 'package:bookia_app/core/theme/cubit/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      fallbackLocale: Locale('en'),
      child: BlocProvider(
        create: (_) => ThemeCubit(),
        child: MainApp(),
      ),
    ),
  );
}