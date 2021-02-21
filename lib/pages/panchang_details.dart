import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:sanatan_dharam/models/details_panchang.dart';
import 'package:sanatan_dharam/services/api_manager.dart';
import 'package:expandable_text/expandable_text.dart';

import '../drawer.dart';

class PanchangPage extends StatefulWidget {
  final id;
  PanchangPage({Key key, @required this.id}) : super(key: key);

  @override
  _PanchangPageState createState() => _PanchangPageState(id: this.id);
}

class _PanchangPageState extends State<PanchangPage> {
  final id;
  _PanchangPageState({@required this.id});
  List homepageBanners = [];
  int index = 0;

  Future<DetailsPanchang> _tDetailsModel;

  // Future<Temples> futureTemples;

  @override
  void initState() {
    super.initState();
    //print(_checkInternetConnectivity());
    _checkInternetConnectivity().then((network) {
      if (network != null && network) {
        if (this.id != null) {
          //print(url);
          _tDetailsModel = API_Manager().getPanchangDetails(this.id);
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
    homepageBanners = [
      Image.network(
        "https://shrisanatandharam.com/SliderImg/shrisanatandharam-slider-img-1.jpg",
        fit: BoxFit.cover,
      ),
      Image.network(
        "https://shrisanatandharam.com/SliderImg/shrisanatandharam-slider-img-2.jpg",
        fit: BoxFit.cover,
      ),
      Image.network(
        "https://shrisanatandharam.com/SliderImg/shrisanatandharam-slider-img-3.jpg",
        fit: BoxFit.cover,
      ),
      Image.network(
        "https://shrisanatandharam.com/SliderImg/shrisanatandharam-slider-img-4.jpg",
        fit: BoxFit.cover,
      ),
      Image.network(
        "https://shrisanatandharam.com/SliderImg/shrisanatandharam-slider-img-5.jpg",
        fit: BoxFit.cover,
      ),
    ];

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
                      FutureBuilder<DetailsPanchang>(
                          future: _tDetailsModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var itemCount = snapshot.data.panchanglist.length;
                              if (itemCount > 0) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                          snapshot.data.panchanglist[0].title,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ExpandableText(
                                        snapshot.data.panchanglist[0].fullDesc,
                                        expandText: 'show more',
                                        maxLines: 20,
                                        collapseText: '...show less',
                                        linkColor: Colors.red,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                );
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

Widget _carouselItem(context, String imgPath, String title) {
  return InkWell(
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  image: NetworkImage(imgPath), fit: BoxFit.cover)),
        ),
      ],
    ),
  );
}
