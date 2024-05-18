import 'package:get/get.dart';
import 'package:treasure_tracker/ui/welcome_dashboard/welcome_controller.dart';

class WelcomeDashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeDashboardController>(() => WelcomeDashboardController());
  }
}
