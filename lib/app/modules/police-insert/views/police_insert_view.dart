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
      body: Center(
        child: Text(
          'PoliceInsertView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
