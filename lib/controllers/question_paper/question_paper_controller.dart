import 'package:get/get.dart';
import 'package:howlkar/controllers/question_paper/auth_controller.dart';
import 'package:howlkar/services/firebase_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../firebase_ref/refrences.dart';
import '../../models/question_paper_model.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allpapers = <QuestionPaperModel>[].obs;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];

    try {
      //getting all data from the collection made
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allpapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl!;
      }
      allpapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }

  void NavigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isloggedIn()) {}
  }
}
