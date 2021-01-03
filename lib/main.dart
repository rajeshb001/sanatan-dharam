import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Awesome App',
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.purple),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome App'),
      ),
      body: Container(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("B Rajesh"),
              accountEmail: Text("rajeshb@interfinet.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1497551060073-4c5ab6435f12?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80"),
              ),
            ),
            ListTile(
              title: Text("Account"),
              leading: Icon(Icons.person),
              subtitle: Text("Personal Details"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              title: Text("Email"),
              leading: Icon(Icons.email),
              subtitle: Text("rajeshb@interfinet.com"),
              trailing: Icon(Icons.send),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
    );
  }
}
