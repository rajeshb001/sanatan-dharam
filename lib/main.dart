
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
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
      //home:  Constants.prefs.getBool("loggedin") == true ? HomePage() : LoginPage(),
      //home:  HomePage(),
      home: SplashScreen(
        seconds: 5,
        image: Image.asset("assets/logo.png"),
        photoSize: 200.0,
        backgroundColor: Colors.redAccent,
        navigateAfterSeconds: HomePage(),
        loaderColor: Colors.white,
      ),
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {
        "/login":(context) => LoginPage(),
        "/home":(contxt) => HomePage(), 
      },
    ),
  );
}

