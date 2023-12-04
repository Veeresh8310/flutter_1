import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List response = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(itemBuilder: (context,index){
          return ListTile(
            leading: Image.network(response[index]['url']),
            title: Text(response[index]['title']),
          );
        },itemCount: response.length,),
        floatingActionButton: FloatingActionButton(onPressed: ()async{
          final data = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
          response = jsonDecode(data.body);
          setState(() {
            
          });
        } , child: Text("+"),),
      ),
    );
  }
}