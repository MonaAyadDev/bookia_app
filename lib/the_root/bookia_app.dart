import 'package:bookia_app/core/Routes/app_router.dart';
import 'package:bookia_app/core/theme/cubit/theme_cubit.dart';
import 'package:bookia_app/features/main/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: context.read<ThemeCubit>().appTheme,
              onGenerateRoute: AppRouter.onGenerateRoute,
              home: const MainScreen(),
            );
          },
        );
      },
    );
  }
}
