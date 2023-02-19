import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:gujarat_police_client_side/app/API/API.dart';
import 'package:gujarat_police_client_side/app/Exceptions/ValidationException.dart';
import 'package:gujarat_police_client_side/app/jsonData/Police/police_apis.dart';
import 'package:gujarat_police_client_side/app/routes/app_pages.dart';
import 'package:path/path.dart';

import '../../../../util/TextUtils.dart';
import '../../../Constants/enums.dart';
import '../../../holders/get_storage.dart';

class PoliceInsertController extends GetxController {
  //TODO: Implement PoliceInsertController
  final policeFile = Rxn<FilePickerResult>();
  // final policeExcelFile = Rxn<File>();
  String filename = "";
  final user = GetStorage();

  String? get policeName => LocalStorage.getUserName();
  String? get policeNumber => LocalStorage.getPhoneNumber();

  final password = "".obs;

  @override
  void onInit() {
    super.onInit();
    print(policeName.toString() + policeNumber.toString());
    if (!TextUtils.notBlankNotEmpty(policeName) ||
        !TextUtils.notBlankNotEmpty(policeNumber)) {
      Get.toNamed(Routes.USER_DETAIL);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void pickFile() async {
  //   policeFile.value = await FilePicker.platform.pickFiles();

  //   if (policeFile != null) {
  //     policeExcelFile.value = File(policeFile.value!.files.first);
  //     Uint8List? uploadfile = policeFile.value!.files.single.bytes;
  //     filename = basename(policeFile.value!.files.single.name);
  //   } else {
  //     throw ValidationException("Some Fields are required to upload ")
  //         .showValidationSnackBar();
  //   }
  //   update();
  // }

  Future<void> pickAndUploadFile() async {
    policeFile.value = await FilePicker.platform.pickFiles();

    if (policeFile.value != null ||
        TextUtils.notBlankNotEmpty(password.value)) {
      //     policeExcelFile.value = File(policeFile.value!.files.first);
      //     Uint8List? uploadfile = policeFile.value!.files.single.bytes;
      //     filename = basename(policeFile.value!.files.single.name);
      //   } else {
      //     throw ValidationException("Some Fields are required to upload ")
      //         .showValidationSnackBar();
      //   }

      final fileBytes = policeFile.value!.files.single.bytes;
      filename = policeFile.value!.files.single.name;

      // final url = Uri.parse('http://your-upload-endpoint.com');
      // final request = http.MultipartRequest('POST', url);

      PoliceApi.insertPoliceUsingExcel(API_Decision.BOTH, 1, fileBytes!,
          filename, policeName ?? "", policeNumber ?? "", "0", password.value);
      // request.files.add(http.MultipartFile.fromBytes(
      //   'file',
      //   fileBytes!,
      //   filename: fileName,
      // ));

      // final response = await request.send();

      // if (response.statusCode == 200) {
      //   print('File uploaded successfully!');
      // } else {
      //   print('File upload failed.');
      // }
    } else {
      throw ValidationException("Some Fields are required to upload ")
          .showValidationSnackBar();
    }
    update();
  }

  passwordUpdated(String text) {
    password.value = text;
    update();
  }
}
