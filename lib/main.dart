import 'package:flutter/material.dart';
import 'package:rentapp/views/landingpage.dart';
import 'package:rentapp/views/login.dart';
import 'package:rentapp/views/welcomepage.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LandingPage(),
    );
  }
}

//to add phone number also in authentication like google and facebook