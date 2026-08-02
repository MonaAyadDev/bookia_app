import 'package:bookia_app/core/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ChangeState(ThemeApp.lightTheme));

  ThemeData get appTheme => (state as ChangeState).theme;
  bool get isDark => appTheme == ThemeApp.darkTheme;

  void changeMode() {
    final newTheme = isDark ? ThemeApp.lightTheme : ThemeApp.darkTheme;
    emit(ChangeState(newTheme));
  }
}
