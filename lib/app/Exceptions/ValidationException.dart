import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValidationException implements Exception {
  String? cause;
  ValidationException(String s, {this.cause});

  final validationSnackBar = Get.snackbar(
    "warning",
    "Some fields are required",
    icon: const Icon(Icons.pending, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.yellow,
  );

  showValidationSnackBar() {
    Get.snackbar(
      "Warning",
      cause ?? "Some fields are missing",
      icon: const Icon(Icons.pending, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.yellow,
    );
  }
}
