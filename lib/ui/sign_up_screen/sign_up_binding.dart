import 'package:get/get.dart';
import 'package:treasure_tracker/ui/sign_up_screen/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    String? email = Get.parameters['email'];
    Get.lazyPut<SignUpController>(() => SignUpController(email: email));
  }
}
