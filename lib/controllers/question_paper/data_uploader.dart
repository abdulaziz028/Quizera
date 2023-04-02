import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:howlkar/firebase_ref/loading_status.dart';
import 'dart:convert';

import 'package:howlkar/models/question_paper_model.dart';

import '../../firebase_ref/refrences.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.Loading.obs;

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.Loading; //loadingStatus is obs

    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //load json file and print path
    final paperInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/paper") && path.contains(".json"))
        .toList();
    List<QuestionPaperModel> questionsPapers = [];
    for (var paper in paperInAssets) {
      String StringPaperContent = await rootBundle.loadString(paper);
      questionsPapers
          .add(QuestionPaperModel.fromJson(json.decode(StringPaperContent)));
    }
    // print('Items number ${questionsPapers[0].id}');
    var batch = fireStore.batch();

    for (var paper in questionsPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count": paper.questions == null ? 0 : paper.questions!.length
      });

      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer
        });
        for (var answer in questions.answers) {
          batch.set(questionPath.collection("answers").doc(answer.identifier),
              {"identifer": answer.identifier, "answer": answer.answer});
        }
      }
    }

    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }
}
