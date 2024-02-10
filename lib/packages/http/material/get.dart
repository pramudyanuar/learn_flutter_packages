import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LearnHTTPGet extends StatefulWidget {

  @override
  State<LearnHTTPGet> createState() => _LearnHTTPGetState();
}

class _LearnHTTPGetState extends State<LearnHTTPGet> {
  late String id = "", data ="", email="",  first_name="", last_name="", avatarUrl="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Get'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Divider(height: 20, color: Colors.transparent,),
            Column(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: NetworkImage(avatarUrl.toString()),
                ),
                Text("ID : $id"),
                Text("Email : $email"),
                Text("First Name : $first_name"),
                Text("Last Name : $last_name"),
              ],
            ),
            ElevatedButton(onPressed : () async {
              var response = await http.get(Uri.parse("https://reqres.in/api/users/4"));
              Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
              if (response.statusCode == 200) {
                setState(() {
                  id = data['data']['id'].toString();
                  email = data['data']['email'];
                  first_name = data['data']['first_name'];
                  last_name = data['data']['last_name'];
                  avatarUrl = data['data']['avatar'];
                
                });
              } else {
                Get.snackbar("Error ${response.statusCode}","");
              }
            }, child: Text("GET DATA")),
          ],
        ),
      ),
    );
  }
}