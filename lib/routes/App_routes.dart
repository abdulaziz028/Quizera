import 'package:howlkar/controllers/question_paper/question_paper_controller.dart';
import 'package:howlkar/controllers/zoom_drawer_controller.dart';
import 'package:howlkar/screens/splash/introduction.dart';
import '../screens/splash/home/home_Screen.dart';
import '../screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../services/firebase_storage_service.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(
          name: "/introduction",
          page: () => AppIntroductionScreen(),
        ),
        GetPage(
            name: "/home",
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
      ];
}
