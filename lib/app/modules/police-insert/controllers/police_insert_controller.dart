import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:file_picker/file_picker.dart';

class PoliceInsertController extends GetxController {
  //TODO: Implement PoliceInsertController
  final policeFile = Rxn<FilePickerResult>();

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

  void pickFile() async {
    policeFile.value = await FilePicker.platform.pickFiles();

    if (policeFile != null) {
      File file = File(policeFile.value!.files.single.path!);
      // Do something with the file
    }
  }
}
