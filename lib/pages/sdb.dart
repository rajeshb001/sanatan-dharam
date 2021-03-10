import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:sanatan_dharam/models/homepage_sdp.dart';
import 'package:sanatan_dharam/services/api_manager.dart';
import 'package:flutter_html/flutter_html.dart';

import '../drawer.dart';

class SdpPage extends StatefulWidget {
  @override
  _SdpPageState createState() => _SdpPageState();
}

class _SdpPageState extends State<SdpPage> {
  int index = 0;

  Future<Sdp> _sdpModel;

  // Future<Temples> futureTemples;

  @override
  void initState() {
    super.initState();
    //print(_checkInternetConnectivity());
    _checkInternetConnectivity().then((network) {
      if (network != null && network) {
        _sdpModel = API_Manager().getSDP();
        getData();
        //print(_welcomeModel);
      } else {
        _showDialog("No Internet", "You're not connected to any network.");
      }
    });
    //futureTemples = fetchTemples();
    //print(futureTemples.toString());
  }

  getData() async {
    //Text(item);
    //data = data['homepageTempledetailModels'];
    //print(data);
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
        title: Text('Katha/Kirtan'),
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
            child: _sdpModel != null
                ? Column(
                    children: [
                      FutureBuilder<Sdp>(
                          future: _sdpModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var fullDesc = snapshot.data.sdp;
                              fullDesc = fullDesc.replaceAll("< ", "<");
                              fullDesc = fullDesc.replaceAll(" />", "/>");
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: Text(
                                      "Sanatan Dharam Pratinidhi Sabha",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Html(
                                      data: fullDesc,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            }
                            return Column(children: [
                              SizedBox(
                                height: 400,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ]);
                          }),
                      SizedBox(height: 40),
                    ],
                  )
                : Column(children: [
                    SizedBox(
                      height: 400,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ]),
          )),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/sdp");
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
