import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Image.asset('assets/sanatandharam-logo.png'),
            ),
            color: Colors.red,
            height: 150,
          ),
          ListTile(
            title: Text("HOME"),
            leading: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/home");
            },
          ),
          ListTile(
            title: Text("SDP SABHA"),
            leading: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/temples");
            },
          ),
          ListTile(
            title: Text("TEMPLES"),
            leading: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/temples");
            },
          ),
          ListTile(
            title: Text("PANCHANG"),
            leading: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("KATHA/KIRTAN"),
            leading: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("MARRIAGE BUREAU"),
            leading: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("VEDIC ACHARYA"),
            leading: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("GAUSHALA"),
            leading: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("MANTRA/CHALISA"),
            leading: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
