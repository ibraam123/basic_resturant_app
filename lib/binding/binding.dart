

import 'package:basic_resturant_app/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../controllers/items_controller.dart';

class ControllersBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ItemsController());
  }

}