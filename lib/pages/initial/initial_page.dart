
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'inital_controller.dart';

class InitialPage extends GetView<InitialController> {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Initial Page'),
      ),
      body: const Center(
        child: Text('Initial Page'),
      ),
    );
  }
}
