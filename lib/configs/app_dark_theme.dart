import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:howlkar/configs/themes/sub_theme_data_mixing.dart';

const Color primaryDarkColorDark = Color(0xFF2e3c62);

const Color primaryColorDark = Color(0xFF399ace1);
const Color mainTextColorDark = Colors.white;

class DarkTheme with SubThemeData {
  ThemeData buildhDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
            bodyColor: mainTextColorDark, displayColor: mainTextColorDark));
  }
}
