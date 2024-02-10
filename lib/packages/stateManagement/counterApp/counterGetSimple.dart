import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class counterGetSimple extends StatelessWidget {

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
              GetBuilder<CounterController>(
                init: CounterController(),
                builder: (counter) {
                  return Text('The value is ${counter.count}');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    Get.find<CounterController>().increment();
                  }, child: Text('Increment')),
                  ElevatedButton(onPressed: () {
                    Get.find<CounterController>().decerement();
                  }, child: Text('Decrement')),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.find<CounterController>().updateStats();
          },
          child: Icon(Icons.refresh),
        )
    );
  }
}

class CounterController extends GetxController {
  var count = 0;
  void increment() {
    count++;
  }
  void decerement() {
    count--;
  }
  void updateStats() {
    update();
  }
}
