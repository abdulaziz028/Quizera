import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:howlkar/configs/themes/app_color.dart';
import 'package:howlkar/controllers/question_paper/question_paper_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:howlkar/controllers/zoom_drawer_controller.dart';
import 'package:howlkar/screens/splash/home/question_card.dart';
import 'package:howlkar/widgets/app_circle_button.dart';

import '../../../configs/themes/custom_Text_style.dart';
import '../../../configs/themes/ui_parameters.dart';
import '../../../widgets/app_icons.dart';
import '../../../widgets/content_area.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../menu_scree.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var fontLoader = FontLoader('AppIcons');
    fontLoader.addFont(rootBundle.load('assets/icons/AppIcons.ttf'));
    fontLoader.load();
    QuestionPaperController _questionPaperController = Get.find();

    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_) {
        return ZoomDrawer(
          borderRadius: 50.0,
          controller: _.zoomDrawerController,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.DefaultStyle,
          slideWidth: MediaQuery.of(context).size.width * 0.4,
          menuScreen: MyMenuScreen(),
          mainScreen: Container(
              decoration: BoxDecoration(gradient: mainGradient()),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(mobileScreenPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppCircleButton(
                              child: const Icon(
                                AppIcons.menuLeft,
                              ),
                              onTap: controller.toggleDrawer,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  const Icon(
                                    AppIcons.peace,
                                  ),
                                  Text(
                                    'Hello there',
                                    style: detailText.copyWith(
                                        color: onSurfaceTextColor),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "What do you want to learn today",
                              style: headerText,
                            )
                          ],
                        )),
                    Expanded(
                      child: ContentArea(
                        addpadding: false,
                        child: Obx(() => ListView.separated(
                              padding: UIParameters.mobileScreenPadding,
                              itemBuilder: (BuildContext context, int index) {
                                return QuestionCard(
                                    model: _questionPaperController
                                        .allpapers[index]);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(height: 20);
                              },
                              itemCount:
                                  _questionPaperController.allpapers.length,
                            )),
                      ),
                    ),
                  ],
                ),
              )),
        );
      }),
    );
  }
}
