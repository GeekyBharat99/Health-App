import 'package:get/get.dart';
import 'package:health_app/controller/health_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelthRepository());
  }
}
