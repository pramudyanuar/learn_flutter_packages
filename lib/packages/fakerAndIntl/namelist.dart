import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

class LearnFaker extends StatefulWidget {
  const LearnFaker({super.key});

  @override
  State<LearnFaker> createState() => _LearnFakerState();
}

class _LearnFakerState extends State<LearnFaker> {

  String tanggal = DateTime.now().toIso8601String();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LEARN FAKER AND INTL'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://picsum.photos/id/${random.integer(999, min:1)}/200/300"),
              ),
              title: Text(Faker().person.name()),
              trailing: Text(Faker().address.city()),
              subtitle: Text("${DateFormat.yMMMMEEEEd().add_jms().format(DateTime.parse(tanggal))}"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});},
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}