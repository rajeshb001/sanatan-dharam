import 'package:flutter/material.dart';
import 'package:flutter_learnings/utils/Constants.dart';

import '../drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  var myText = "Change Me";
  var url = "http://jsonplaceholder.typicode.com/photos";
  var data;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async{
    var res = await http.get(url);
    data = jsonDecode(res.body);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome App'),
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app) , onPressed: (){
            Constants.prefs.setBool("loggedin", false);
            Navigator.pushReplacementNamed(context, "/login");
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: data != null
              ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(itemBuilder: (context, index){
                  return ListTile(
                    title: Text(data[index]['title']),
                    subtitle: Text("ID: ${data[index]['id']}"),
                    leading: Image.network(data[index]['url']),
                  );
                }, itemCount:data.length ),
              )
              : Center(
                  child: CircularProgressIndicator(),
         ),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
