import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/colors.dart';

final ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorsTheme.bgTela,
    surface: ColorsTheme.bgTela,
    primary: ColorsTheme.fontText,
    onPrimary: ColorsTheme.bgInput,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorsTheme.bgTela,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: ColorsTheme.bgInput,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        borderSide: BorderSide(color: ColorsTheme.bgTela)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    contentPadding: EdgeInsets.all(20),
  ),
  /* outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                side: BorderSide(
                    color: ColorsTheme.bgTela, style: BorderStyle.solid))),
          ),
        ), */
  /* scaffoldBackgroundColor: ColorsTheme.bgTela,
        colorScheme: ColorScheme.fromSeed(
            seedColor: ColorsTheme.bgTela, primary: ColorsTheme.bgTela), */
  useMaterial3: true,
);
