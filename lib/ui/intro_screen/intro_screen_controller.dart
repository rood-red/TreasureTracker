import 'package:get/get.dart';
import 'package:treasure_tracker/routes/app_pages.dart';

class IntroScreenController extends GetxController {
  void navigateToLogin() {
    Get.rootDelegate.toNamed(AppRoutes.login);
  }
}
