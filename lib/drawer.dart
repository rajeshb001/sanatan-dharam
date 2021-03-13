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
            leading: Icon(Icons.home),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/home");
            },
          ),
          ListTile(
            title: Text("SDP SABHA"),
            leading: Icon(Icons.api),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/sdp");
            },
          ),
          ListTile(
            title: Text("TEMPLES"),
            leading: Icon(Icons.circle_notifications),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/temples");
            },
          ),
          ListTile(
            title: Text("PANCHANG"),
            leading: Icon(Icons.date_range),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/panchang");
            },
          ),
          ListTile(
            title: Text("KATHA/KIRTAN"),
            leading: Icon(Icons.chrome_reader_mode),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/kirtan");
            },
          ),
          ListTile(
            title: Text("MARRIAGE BUREAU"),
            leading: Icon(Icons.business),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/marriage");
            },
          ),
          ListTile(
            title: Text("VEDIC ACHARYA"),
            leading: Icon(Icons.people),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/vedic");
            },
          ),
          ListTile(
            title: Text("GAUSHALA"),
            leading: Icon(Icons.table_chart),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/goushala");
            },
          ),
          ListTile(
            title: Text("MANTRA/CHALISA"),
            leading: Icon(Icons.swap_calls),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/mantra");
            },
          ),
        ],
      ),
    );
  }
}
