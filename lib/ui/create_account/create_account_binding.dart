import 'package:get/get.dart';
import 'package:treasure_tracker/services/api/fetch_firebase.dart';
import 'package:treasure_tracker/ui/create_account/create_account_controller.dart';

class CreateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirestoreService>(() => FirestoreService());
    Get.lazyPut<CreateAccountController>(() => CreateAccountController());
  }
}
