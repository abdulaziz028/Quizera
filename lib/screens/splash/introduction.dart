import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:howlkar/configs/themes/app_color.dart';
import 'package:howlkar/widgets/app_circle_button.dart';
import 'package:get/get.dart ';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: mainGradient()),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.star, size: 65),
          SizedBox(height: 40),
          const Text(
            'This is a study app. You can you use it if you are trying to refresh your knoweldege the app is not done yet it will be done soon... )',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: onSurfaceTextColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          AppCircleButton(
              onTap: () => Get.offAndToNamed("/home"),
              child: const Icon(Icons.arrow_forward, size: 35))
        ]),
      ),
    ));
  }
}
