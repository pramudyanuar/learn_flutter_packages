import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packages/packages/stateManagement/counterApp/getChangeTheme.dart';
import 'counterApp/counterGetReactiveGetX.dart';
import 'counterApp/counterGetReactiveObx.dart';
import 'counterApp/counterGetSimple.dart';

class MainGet extends StatelessWidget {
  const MainGet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GETX STATE MANAGEMENT'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Divider(height: 100, color: Colors.transparent,),
              ElevatedButton(onPressed : () {
                Get.to(counterGetReactiveGetX());
              }, child: Text("COUNTER GetX")),
              ElevatedButton(onPressed : () {
                Get.to(counterGetReactiveObx());
              }, child: Text("COUNTER Obx")),
              ElevatedButton(onPressed : () {
                Get.to(counterGetSimple());
              }, child: Text("COUNTER GetBuilder")),
              ElevatedButton(onPressed : () {
                Get.to(changeTheme());
              }, child: Text("Change Theme")),
            ],
          ),
        ),
      ),
    );
  }
}