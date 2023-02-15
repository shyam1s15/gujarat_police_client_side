import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../API/API.dart';
import '../../Constants/enums.dart';

class PoliceApi {
  static void insertPoliceUsingExcel(
      API_Decision showStatus, int eventId, File policeFile) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse(APIConstants.POLICESTATION_URL_UPLOAD_FROM_EXCEL),
    );
    request.fields.assign(
      'event-id', eventId.toString()
    );
    request.files
        .add(await http.MultipartFile.fromPath('file', policeFile.path));
    final response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success) {
          Get.snackbar(
            "Success",
            "Police Inserted successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure) {
          Get.snackbar(
            "Failed",
            responseJson['response']['message'],
            icon: const Icon(Icons.cancel_presentation_sharp,
                color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      }
    }
  }
}