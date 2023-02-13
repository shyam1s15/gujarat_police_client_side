import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_detail_controller.dart';

class UserDetailView extends GetView<UserDetailController> {
  UserDetailView({Key? key}) : super(key: key);
  final userNameTextFieldController = TextEditingController();
  final phoneNumberTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UserDetailView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("User Name"),
            TextField(
              controller: userNameTextFieldController,
            ),
            Text("Phone Number"),
            TextField(
              controller: phoneNumberTextFieldController,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                padding: EdgeInsets.all(16),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                controller.createUserNameInStorage(userNameTextFieldController.text, phoneNumberTextFieldController.text);
              },
              child: const Text(
                "Elevated Button",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }
}
