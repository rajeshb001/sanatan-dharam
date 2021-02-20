import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'temple_details.dart';

import '../drawer.dart';

class PanchangPage extends StatefulWidget {
  @override
  _PanchangState createState() => _PanchangState();
}

class _PanchangState extends State<PanchangPage> {
  int index = 0;
  List panchangBanners = [];

  // Future<Temples> futureTemples;

  @override
  void initState() {
    super.initState();
    //print(_checkInternetConnectivity());
    _checkInternetConnectivity().then((network) {
      if (network != null && network) {
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

    panchangBanners = [
      {
        'imagePath':
            "https://shrisanatandharam.com/front-assets/img/panchang/1.jpg",
        'title': 'Daily',
        'id': 1,
      },
      {
        'imagePath':
            "https://shrisanatandharam.com/front-assets/img/panchang/2.jpg",
        'title': 'Ekadashi',
        'id': 2,
      },
      {
        'imagePath':
            "https://shrisanatandharam.com/front-assets/img/panchang/3.jpg",
        'title': 'Purnima',
        'id': 3,
      },
      {
        'imagePath':
            "https://shrisanatandharam.com/front-assets/img/panchang/4.jpg",
        'title': 'Amavasya',
        'id': 4,
      },
      {
        'imagePath':
            "https://shrisanatandharam.com/front-assets/img/panchang/5.jpg",
        'title': 'UpcommingFestival',
        'id': 5,
      },
    ];

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
        title: Text('Panchang'),
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
            child: panchangBanners != null
                ? Column(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        children: panchangBanners
                            .map((item) => _carouselItem(context,
                                item['imagePath'], item['title'], item['id']))
                            .toList(),
                      ),
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
          Navigator.pushReplacementNamed(context, "/temples");
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

Widget _carouselItem(context, String imgPath, String title, int orgId) {
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
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
