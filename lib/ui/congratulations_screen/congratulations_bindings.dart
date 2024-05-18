import 'package:get/get.dart';
import 'package:treasure_tracker/ui/congratulations_screen/congratulations_controller.dart';

class CongratulationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CongratulationsController>(() => CongratulationsController());
  }
}
