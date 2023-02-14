import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PoliceInsertController extends GetxController {
  //TODO: Implement PoliceInsertController

  final count = 0.obs;
  final user = GetStorage();

  String get policeName => user.read('user-name');
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
