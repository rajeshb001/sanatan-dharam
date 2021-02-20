import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:sanatan_dharam/pages/home_page.dart';
import 'package:sanatan_dharam/pages/temples.dart';
import 'package:sanatan_dharam/pages/panchang.dart';
import 'package:sanatan_dharam/pages/marriage_bureau.dart';
import 'package:sanatan_dharam/pages/vedic_acharya.dart';
import 'package:sanatan_dharam/pages/goushala.dart';
import 'package:sanatan_dharam/pages/mantra_chalisa.dart';
import 'package:sanatan_dharam/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sanatan_dharam/pages/katha_kirtan.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sanatan Dharam',
      //home:  Constants.prefs.getBool("loggedin") == true ? HomePage() : LoginPage(),
      //home:  HomePage(),
      home: SplashScreen(
        seconds: 5,
        image: Image.asset("assets/sanatandharam-logo.png"),
        photoSize: 200.0,
        backgroundColor: Colors.redAccent,
        gradientBackground: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[Colors.red, Colors.orange],
        ),
        navigateAfterSeconds: HomePage(),
        loaderColor: Colors.white,
      ),
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {
        "/home": (contxt) => HomePage(),
        "/temples": (contxt) => TemplesPage(),
        "/panchang": (contxt) => PanchangPage(),
        "/kirtan": (contxt) => KirtanPage(),
        "/marriage": (contxt) => MarriagePage(),
        "/vedic": (contxt) => VedicPage(),
        "/goushala": (contxt) => GoushalaPage(),
        "/mantra": (contxt) => MantraPage(),
        //"/details": (contxt) => DetailsPage(),
      },
    ),
  );
}
