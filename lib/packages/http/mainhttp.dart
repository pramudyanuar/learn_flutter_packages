import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'material/get.dart';
import 'material/post.dart';
import 'material/putpatch.dart';
import 'material/delete.dart';
import 'material/futurebuilder.dart';
import 'practice/weather.dart';

class MainHTTP extends StatelessWidget {
  const MainHTTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Column(
            children: [
              SizedBox(height: 5,),
              Text("MATERIAL"),
              SizedBox(height: 20,),
              ElevatedButton(onPressed : () {
                Get.to(LearnHTTPGet());
              }, child: Text("GET")),
              ElevatedButton(onPressed : () {
                Get.to(LearnHTTPPost());
              }, child: Text("POST")),
              ElevatedButton(onPressed : () {
                Get.to(LearnHTTPPut());
              }, child: Text("PUT")),
              ElevatedButton(onPressed : () {
                Get.to(LearnHTTPPatch());
              }, child: Text("PATCH")),
              ElevatedButton(onPressed : () {
                Get.to(LearnHTTPDellete());
              }, child: Text("DELETE")),
              ElevatedButton(onPressed : () {
                Get.to(LearnHTTPFutureBuilder());
              }, child: Text("FUTURE BUILDER")),
              ElevatedButton(onPressed : () {
                Get.to(LearnHTTPFutureBuilderWithModel());
              }, child: Text("FUTURE BUILDER WITH MODEL")),
              Divider(),
              SizedBox(height: 5,),
              Text("PRACTICE"),
              SizedBox(height: 20,),
              ElevatedButton(onPressed : () {
                Get.to(WeatherApp());
              }, child: Text("WEATHER API APP")),
            ],
          ),
        ),
    );
  }
}