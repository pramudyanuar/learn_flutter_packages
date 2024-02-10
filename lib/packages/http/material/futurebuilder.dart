import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import './model.dart';

class LearnHTTPFutureBuilder extends StatefulWidget {

  @override
  State<LearnHTTPFutureBuilder> createState() => _LearnHTTPFutureBuilderState();
}

class _LearnHTTPFutureBuilderState extends State<LearnHTTPFutureBuilder> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Get'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: http.get(Uri.parse("https://reqres.in/api/users?page=2")),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> data = json.decode(snapshot.data!.body) as Map<String, dynamic>;
              return ListView.builder(
                itemCount: data['data'].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 23,
                      backgroundImage: NetworkImage(data['data'][index]['avatar']),
                    ),
                    title: Text(data['data'][index]['first_name']),
                    subtitle: Text(data['data'][index]['email']),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      )
    );
  }
}


class LearnHTTPFutureBuilderWithModel extends StatefulWidget {

  @override
  State<LearnHTTPFutureBuilderWithModel> createState() => _LearnHTTPFutureBuilderWithModelState();
}

class _LearnHTTPFutureBuilderWithModelState extends State<LearnHTTPFutureBuilderWithModel> {
  List<Datum> user = [];

  Future getData() async {
    try{
      var response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
      List data = (json.decode(response.body)as Map <String, dynamic>)['data'];
      data.forEach((element) {
      user.add(Datum.fromJson(element));
    }
    );
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP MODEL'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else {
              return ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 23,
                      backgroundImage: NetworkImage(user[index].avatar),
                    ),
                    title: Text(user[index].firstName),
                    subtitle: Text(user[index].email),
                  );
                },
              );
            }
          },
        ),
      )
    );
  }
}