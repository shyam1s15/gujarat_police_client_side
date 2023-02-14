import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gujarat_police_client_side/app/Exceptions/ValidationException.dart';

class UserDetailController extends GetxController {
  //TODO: Implement UserDetailController

  final count = 0.obs;
  final user = GetStorage();

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

  bool createUserNameInStorage(String userName, String phoneNumber) {
    if (userName.isEmpty || phoneNumber.isEmpty) {
      throw ValidationException("Some Fields are required").validationSnackBar;
    }
    user.write('user-name', userName);
    user.write('phone-number', phoneNumber);
    return true;
  }
}
