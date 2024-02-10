import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'model.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  TextEditingController cityController = TextEditingController();
  late String temperature = "", wind = "", description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 50,
            child: TextField(
            controller: cityController,
            decoration: InputDecoration(
              hintText: 'Enter City Name',
              suffixIcon: IconButton(
                onPressed: () async {
                  print("pressed");
                  var response = await http.get(Uri.parse('https://goweather.herokuapp.com/weather/${cityController.text}'));
                  Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
                  if (response.statusCode == 200) {
                    setState(() {
                      temperature = data['temperature'].toString();
                      wind = data['wind'].toString();
                      description = data['description'].toString();
                    });
                  } else {
                    Get.snackbar("Error ${response.statusCode}","");
                  }
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),
          ),
          Container(
            height: 200,
            width: 400,
            child: Center(
              child: Text("${cityController.text}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Text("$description", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Data(value: "$temperature", type: "temp"),
                Data(value: "$wind", type: "wind")
              ],
            ),
          )
        ],
      )
    );
  }
}

class Data extends StatelessWidget {
  final String value;
  final String type;

  const Data({
    Key? key,
    required this.value,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Center(
        child: Column(
          children: [
            Text(
              type,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}