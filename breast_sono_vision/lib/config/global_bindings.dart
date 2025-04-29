import 'package:breast_sono_vision/presentation/controllers/permission_controller.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PermissionController(), permanent: true);
  }
}
