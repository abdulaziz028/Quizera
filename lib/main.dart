import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:howlkar/bindings/intial_bindings.dart';
import 'package:howlkar/configs/themes/app_light_theme.dart';
import 'package:howlkar/controllers/question_paper/data_uploader_screen.dart';
import 'package:howlkar/controllers/question_paper/theme_Controller.dart';
import 'package:howlkar/routes/App_routes.dart';
import 'package:howlkar/screens/splash/introduction.dart';
import 'package:howlkar/screens/splash/splash_screen.dart';

import 'configs/app_dark_theme.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(GetMaterialApp(home: DataUploaderScreen()));
// }
