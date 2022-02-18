import 'package:get/get.dart';
import 'package:voltranapp_interview/pages/home/controller/homeController.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
