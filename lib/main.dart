
import 'package:flutter/material.dart';
import 'package:flutter_learnings/pages/home_page.dart';
import 'package:flutter_learnings/pages/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Awesome App',
      home: LoginPage(),
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        "/login":(context) => LoginPage(),
        "/home":(contxt) => HomePage(), 
      },
    ),
  );
}

