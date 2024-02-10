import 'package:flutter/material.dart';
import 'package:get/get.dart';

class changeTheme extends StatelessWidget {
  const changeTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Theme'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Divider(height: 100, color: Colors.transparent,),
            ElevatedButton(onPressed : () {
              Get.snackbar("title", "message");
            }, child: Text("SNACKBAR")),
          ],
        ),
      )
    );
  }
}