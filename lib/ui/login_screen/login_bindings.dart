import 'package:get/get.dart';
import 'package:treasure_tracker/services/api/fetch_firebase.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirestoreService>(() => FirestoreService());

    Get.lazyPut<LoginController>(() => LoginController());
  }
}
