import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';

class YoutubeLivePage extends StatefulWidget {
  final id;
  YoutubeLivePage({Key key, @required this.id}) : super(key: key);

  @override
  _YoutubeLivePageState createState() => _YoutubeLivePageState(id: this.id);
}

class _YoutubeLivePageState extends State<YoutubeLivePage> {
  final id;
  _YoutubeLivePageState({@required this.id});
  int index = 0;

  @override
  void initState() {
    super.initState();
    //print(_checkInternetConnectivity());
    _checkInternetConnectivity().then((network) {
      if (network != null && network) {
        if (this.id != null) {
          //print(id);
          getData();
        }
        //print(_welcomeModel);
      } else {
        _showDialog("No Internet", "You're not connected to any network.");
      }
    });
    //futureTemples = fetchTemples();
    //print(futureTemples.toString());
  }

  getData() async {
    setState(() {});
  }

  _showDialog(title, text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<bool> _checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Shri Sanatan Dharam'),
        actions: [],
      ),
      body: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/aum.PNG"),
                repeat: ImageRepeat.repeat),
          ),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Text("Testing"),
              
              SizedBox(height: 40),
              
            ],
          ))),
      drawer: MyDrawer(),
    );
  }
}
