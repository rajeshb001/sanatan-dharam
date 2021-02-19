import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:sanatan_dharam/models/homepage_gs.dart';
import 'package:sanatan_dharam/models/homepage_school.dart';
import 'package:sanatan_dharam/models/homepage_temples.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sanatan_dharam/models/homepage_live.dart';
import 'package:sanatan_dharam/models/homepage_mb.dart';
import 'package:sanatan_dharam/models/homepage_dispensary.dart';
import 'package:sanatan_dharam/services/api_manager.dart';
import 'temple_details.dart';

import '../drawer.dart';

class TemplesPage extends StatefulWidget {
  @override
  _TemplesPageState createState() => _TemplesPageState();
}

class _TemplesPageState extends State<TemplesPage> {
  List homepageBanners = [];
  List panchangBanners = [];
  List mantraBanners = [];
  List vedicBanners = [];
  int index = 0;

  Future<Welcome> _welcomeModel;
  Future<Temples> _templesModel;
  Future<Marriage> _marriageModel;
  Future<Dispensary> _dispensaryModel;
  Future<School> _schoolModel;
  Future<Gs> _gsModel;

  // Future<Temples> futureTemples;

  @override
  void initState() {
    super.initState();
    //print(_checkInternetConnectivity());
    _checkInternetConnectivity().then((network) {
      if (network != null && network) {
        _welcomeModel = API_Manager().getNews();
        _templesModel = API_Manager().getTemples();
        _marriageModel = API_Manager().getMarriages();
        _dispensaryModel = API_Manager().getDispensary();
        _schoolModel = API_Manager().getSchool();
        _gsModel = API_Manager().getGs();
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
        title: Text('TEMPLES'),
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
            child: _templesModel != null
                ? Column(
                    children: [
                      FutureBuilder<Temples>(
                          future: _templesModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var itemCount = snapshot
                                  .data.homepageTempledetailModels.length;
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemCount: itemCount,
                                    itemBuilder: (context, index) {
                                    var item = snapshot
                                        .data.homepageTempledetailModels[index];
                                        return _carouselItem(
                                        context,
                                        item.imageName,
                                        item.organisationName,
                                        item.organisationId);
                                    
                                  });
                             
                            }
                            return CircularProgressIndicator();
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
          Navigator.pushReplacementNamed(context, "/home");
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

Widget _carouselItem(context, String imgPath, String title, int orgId) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical:5),
    child: InkWell(
    onTap: () {
      //print("Click event on Container");
      //Navigator.pushReplacementNamed(context, "/details");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TemplePage(
              id: orgId,
            ),
          ));
    },
    child: Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  image: NetworkImage(imgPath), fit: BoxFit.cover)),
        ),
        Container(
            height: 30,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 170.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Colors.red, Colors.orange],
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            )),
      ],
    ),
  ));
}
