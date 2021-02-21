import 'dart:math';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:sanatan_dharam/models/details_mantra.dart';
import 'package:sanatan_dharam/services/api_manager.dart';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../drawer.dart';

class MantraPage extends StatefulWidget {
  final id;
  MantraPage({Key key, @required this.id}) : super(key: key);

  @override
  _MantraPageState createState() => _MantraPageState(id: this.id);
}

class _MantraPageState extends State<MantraPage> {
  final id;
  _MantraPageState({@required this.id});
  List homepageBanners = [];
  int index = 0;

  Future<DetailsMantra> _tDetailsModel;

  // Future<Temples> futureTemples;

  @override
  void initState() {
    super.initState();
    //print(_checkInternetConnectivity());
    _checkInternetConnectivity().then((network) {
      if (network != null && network) {
        if (this.id != null) {
          //print(url);
          _tDetailsModel = API_Manager().getMantraDetails(this.id);
          //print(_tDetailsModel);
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
            child: _tDetailsModel != null
                ? Column(
                    children: [
                      FutureBuilder<DetailsMantra>(
                          future: _tDetailsModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var itemCount =
                                  snapshot.data.chalishaAratiList.length;
                              if (itemCount > 0) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemCount: itemCount,
                                    itemBuilder: (context, index) {
                                      var item = snapshot
                                          .data.chalishaAratiList[index];
                                      return Card(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ListTile(
                                              leading:
                                                  Icon(Icons.download_rounded),
                                              title: Text(item.title),
                                              trailing: FlatButton(
                                                child: const Text(
                                                  'Download',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                onPressed: () async {
                                                  final status =
                                                      await Permission.storage
                                                          .request();
                                                  if (status.isGranted) {
                                                    final externalDir =
                                                        await getExternalStorageDirectory();
                                                    Random rnd = new Random();
                                                    var fileName =
                                                        rnd.hashCode.toString();
                                                    FlutterDownloader.enqueue(
                                                      url: item.fileName,
                                                      savedDir:
                                                          externalDir.path,
                                                      fileName: fileName,
                                                      showNotification: true,
                                                      openFileFromNotification:
                                                          true,
                                                    );
                                                  } else {
                                                    print("Permission deined");
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              } else {
                                return SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: Container(
                                      child: Text(
                                        "No Data Found",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ),
                                );
                              }
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
    );
  }
}
