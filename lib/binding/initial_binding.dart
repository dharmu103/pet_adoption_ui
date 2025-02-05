import 'package:get/get.dart';
import 'package:pet_adoption_app/controller/controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
