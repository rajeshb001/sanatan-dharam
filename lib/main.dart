import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: 'Awesome App',
    home: HomePage(),
  ));
}
  
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome App'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          width: 100,
          height: 100,
          child: Text('I am a Box', 
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(
              color: Colors.black,
              blurRadius: 5,
              offset: Offset(7.0,5.0),
            )],
            color: Colors.red,
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.red]
            )),
        ),
      ),
    );
  }
}