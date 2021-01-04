
import 'package:flutter/material.dart';
import 'package:flutter_learnings/pages/home_page.dart';
import 'package:flutter_learnings/pages/login_page.dart';
import 'package:flutter_learnings/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(
    MaterialApp(
      title: 'Awesome App',
      home:  Constants.prefs.getBool("loggedin") == true ? HomePage() : LoginPage(),
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        "/login":(context) => LoginPage(),
        "/home":(contxt) => HomePage(), 
      },
    ),
  );
}

