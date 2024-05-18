import 'package:get/get.dart';
import 'package:treasure_tracker/routes/app_pages.dart';

class CongratulationsController extends GetxController {
  RxBool isLoading = false.obs;
  void navigateToNextScreen() {
    Get.rootDelegate.toNamed(AppRoutes.welcome);
  }
}
