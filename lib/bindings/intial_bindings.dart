import 'package:get/get.dart';
import 'package:howlkar/controllers/question_paper/auth_controller.dart';
import 'package:howlkar/controllers/question_paper/theme_Controller.dart';

import '../services/firebase_storage_service.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    //Get.put(PapersDataUploader());
    Get.put(AuthController(), permanent: true);

    Get.lazyPut(() => FirebaseStorageService());
  }
}
