import 'package:covid19_tracker_app/services/utilities/controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Controller());
  }
}