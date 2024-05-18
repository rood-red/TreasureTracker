import 'package:get/get.dart';
import 'package:treasure_tracker/services/api/fetch_firebase.dart';
import 'package:treasure_tracker/ui/login_screen/login_screen_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirestoreService>(() => FirestoreService());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
