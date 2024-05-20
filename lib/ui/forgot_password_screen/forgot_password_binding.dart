import 'package:get/get.dart';
import 'package:treasure_tracker/ui/forgot_password_screen/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}
