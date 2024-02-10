import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LearnHTTPPost extends StatefulWidget {
  const LearnHTTPPost({super.key});

  @override
  State<LearnHTTPPost> createState() => _LearnHTTPPostState();
}

class _LearnHTTPPostState extends State<LearnHTTPPost> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Post'),
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
                var response = await http.post(Uri.parse("https://reqres.in/api/users"),
                body: {
                  "name": nameController.text,
                  "job": jobController.text,
                });
                print(response.body);
                Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
                if (response.statusCode == 201) {
                  Get.snackbar("Success", "ID : ${data['id']}\nName : ${data['name']}\nJob : ${data['job']}\nCreated At : ${data['createdAt']}");
                } else {
                  Get.snackbar("Error ${response.statusCode}","");
                }
              }, child: Text("POST DATA")),
            ],
          ),
        ),
      )
    );
  }
}