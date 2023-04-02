import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void onReady() {
    super.onReady();
  }

  void toggleDrawer() {
    print('toggleDrawer called');
    zoomDrawerController.toggle?.call();
    update();
  }

  void signout() {}
  void signIn() {}
  void website() {}
  void email() {
    final Uri emailLaunchUri =
        Uri(scheme: 'mailto', path: 'kinggelle88@gmail.com');
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw 'couldnt launch url $url';
    }
  }
}
