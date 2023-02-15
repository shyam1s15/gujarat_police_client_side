import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/police_insert_controller.dart';

class PoliceInsertView extends GetView<PoliceInsertController> {
  const PoliceInsertView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PoliceInsertView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    controller.pickFile();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Set button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 5.0,
                  ),
                  child: const Text(
                    'Button Text',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Obx(()=>controller.policeFile.value == null ? const CircularProgressIndicator.adaptive()
              : Text (controller.policeFile.value!.files as String))
            ],
          ),
          Center(
            child: Text(
              controller.policeName,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
