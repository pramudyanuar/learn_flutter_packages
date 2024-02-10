import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class counterGetReactiveObx extends StatelessWidget {
  final controller = Get.put(CounterCont());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text('GETX STATE MANAGEMENT'),
              centerTitle: true,
            ),
            body: Center(
            child: Column(
            children: [
              Divider(height: 100, color: Colors.transparent,),
              Obx(() => 
                Text('The value is ${controller.count}'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    controller.increment();
                  }, child: Text('Increment')),
                  ElevatedButton(onPressed: () {
                    controller.decerement();
                  }, child: Text('Decrement')),
                ],
              ),
            ],
          ),
        ),
    );
  }
}

class CounterCont extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }
  void decerement() {
    count--;
  }
}

