import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LearnHTTPDellete extends StatefulWidget {

  @override
  State<LearnHTTPDellete> createState() => _LearnHTTPDelleteState();
}

class _LearnHTTPDelleteState extends State<LearnHTTPDellete> {

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
            ElevatedButton(onPressed : () async {
              var response = await http.delete(Uri.parse("https://reqres.in/api/users/4"));
              if (response.statusCode == 204) {
                setState(() {
                  Get.snackbar("Success", "Success Delete Data");
                });
              } else {
                Get.snackbar("Error ${response.statusCode}","");
              }
            }, child: Text("DELETE")),
          ],
        ),
      ),
    );
  }
}