import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LearnHTTPPut extends StatefulWidget {
  const LearnHTTPPut({super.key});

  @override
  State<LearnHTTPPut> createState() => _LearnHTTPPutState();
}

class _LearnHTTPPutState extends State<LearnHTTPPut> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Put'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
          
              ),
              Divider(height: 20, color: Colors.transparent,),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: jobController,
                decoration: InputDecoration(
                  hintText: "Job",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () async {
                var response = await http.put(Uri.parse("https://reqres.in/api/users/2"),
                body: {
                  "name": nameController.text,
                  "job": jobController.text,
                });
                print(response.body);
                Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
                if (response.statusCode == 200) {
                  Get.snackbar("Success", "Name : ${data['name']}\nJob : ${data['job']}\nUpdated At : ${data['updatedAt']}");
                } else {
                  Get.snackbar("Error ${response.statusCode}","");
                }
              }, child: Text("PUT DATA")),
            ],
          ),
        ),
      )
    );
  }
}

class LearnHTTPPatch extends StatefulWidget {
  const LearnHTTPPatch({super.key});

  @override
  State<LearnHTTPPatch> createState() => _LearnHTTPPatchState();
}

class _LearnHTTPPatchState extends State<LearnHTTPPatch> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Patch'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
          
              ),
              Divider(height: 20, color: Colors.transparent,),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: jobController,
                decoration: InputDecoration(
                  hintText: "Job",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () async {
                var response = await http.patch(Uri.parse("https://reqres.in/api/users/2"),
                body: {
                  "name": nameController.text,
                  "job": jobController.text,
                });
                print(response.body);
                Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
                if (response.statusCode == 200) {
                  Get.snackbar("Success", "Name : ${data['name']}\nJob : ${data['job']}\nUpdated At : ${data['updatedAt']}");
                } else {
                  Get.snackbar("Error ${response.statusCode}","");
                }
              }, child: Text("PUT DATA")),
            ],
          ),
        ),
      )
    );
  }
}