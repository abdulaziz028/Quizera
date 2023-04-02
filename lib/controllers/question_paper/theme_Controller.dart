import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:howlkar/configs/app_dark_theme.dart';
import 'package:howlkar/configs/themes/app_light_theme.dart';

class ThemeController extends GetxController {
  late ThemeData _darktheme;
  late ThemeData _lightTheme;
  @override
  void onInit() {
    intializeThemeData();

    super.onInit();
  }

  intializeThemeData() {
    _darktheme = DarkTheme().buildhDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darktheme;
  ThemeData get lightTheme => _lightTheme;
}
