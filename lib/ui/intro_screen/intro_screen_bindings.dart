// intro_binding.dart
import 'package:get/get.dart';
import 'package:treasure_tracker/ui/intro_screen/intro_screen_controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroScreenController>(() => IntroScreenController());
  }
}
