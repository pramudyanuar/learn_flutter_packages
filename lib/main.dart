import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './packages/http/mainhttp.dart';
import 'packages/fakerAndIntl/namelist.dart';
import './packages/convexBottombar/bottombar.dart';
import './packages/introscreen/intro.dart';
import './packages/stateManagement/mainGet.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home : Scaffold(
        appBar: AppBar(
          title: Text('LEARN FLUTTER PACKAGES'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [
              Divider(height: 100, color: Colors.transparent,),
              ElevatedButton(onPressed : () {
                Get.to(MainHTTP());
              }, child: Text("HTTP")),
              ElevatedButton(onPressed : () {
                Get.to(LearnFaker());
              }, child: Text("FAKER AND INTL")),
              ElevatedButton(onPressed : () {
                Get.to(ConvexBottombar());
              }, child: Text("CONVEX BOTTOMBAR")),
              ElevatedButton(onPressed : () {
                Get.to(IntroScreen());
              }, child: Text("INTRO SCREEN")),
              ElevatedButton(onPressed : () {
                Get.to(MainGet());
              }, child: Text("GETX")),
            ],
          ),
        ),
      )
    );
  }
}