import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:howlkar/controllers/question_paper/data_uploader.dart';
import 'package:howlkar/firebase_ref/loading_status.dart';
import 'data_uploader.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploader Controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Obx(() => Text(
          Controller.loadingStatus.value == LoadingStatus.completed
              ? "uploading completed"
              : "uploading.....")),
    ));
  }
}
