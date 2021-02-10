import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:sanatan_dharam/utils/Constants.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<Temples> fetchTemples() async {
//   final response =
//       await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Temples.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class Temples {
//   final int userId;
//   final int id;
//   final String title;

//   Temples({this.userId, this.id, this.title});

//   factory Temples.fromJson(Map<String, dynamic> json) {
//     return Temples(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  var myText = "Change Me";
  var url = "https://www.shrisanatandharam.com/api/home/HomePage";
  var data;
  List homepageBanners = [];
  int index = 0;

  // Future<Temples> futureTemples;

  @override
  void initState() {
    super.initState();
    //print(_checkInternetConnectivity());
    _checkInternetConnectivity().then((network) {
      if (network != null && network) {
        getData();
      } else {
        _showDialog("No Internet", "You're not connected to any network.");
      }
    });
    //futureTemples = fetchTemples();
    //print(futureTemples.toString());
  }

  getData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);

    homepageBanners = [
      Image.network(
        "https://www.shrisanatandharam.com/FileUpload/AD140BEB-AA50-47E5-BDF8-CBA57EEE2BE7.jpeg",
        fit: BoxFit.cover,
      ),
      Image.network(
        "https://www.shrisanatandharam.com/FileUpload/11F0762D-BE9E-423F-A5CC-2FF369E05456.jpeg",
        fit: BoxFit.cover,
      ),
      Image.network(
        "https://www.shrisanatandharam.com/FileUpload/F5F0178A-4177-4B3D-B76B-894351B1E02D.jpeg",
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
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                //Constants.prefs.setBool("loggedin", false);
                //Navigator.pushReplacementNamed(context, "/login");
                _checkInternetConnectivity();
              })
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/aum.PNG"),
                repeat: ImageRepeat.repeat),
          ),
          child: SingleChildScrollView(
            child: data != null
                ? Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Carousel(
                          dotSize: 4.0,
                          dotSpacing: 15.0,
                          indicatorBgPadding: 5.0,
                          dotBgColor: Colors.transparent,
                          images: homepageBanners,
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "TEMPLES",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.red,
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                      CarouselSlider(
                          items: [
                            _carouselItem(
                                context,
                                "https://www.shrisanatandharam.com/FileUpload/AD140BEB-AA50-47E5-BDF8-CBA57EEE2BE7.jpeg",
                                "Temple Name"),
                            _carouselItem(
                                context,
                                "https://www.shrisanatandharam.com/FileUpload/11F0762D-BE9E-423F-A5CC-2FF369E05456.jpeg",
                                "Temple Name"),
                            _carouselItem(
                                context,
                                "https://www.shrisanatandharam.com/FileUpload/F5F0178A-4177-4B3D-B76B-894351B1E02D.jpeg",
                                "Temple Name"),
                          ],
                          options: CarouselOptions(
                            height: 200,
                            enlargeCenterPage: true,
                            autoPlayCurve: Curves.easeInOut,
                          )),
                      SizedBox(height: 40),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "PANCHANG",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.red,
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                      CarouselSlider(
                          items: [
                            _carouselItem(
                                context,
                                "https://www.shrisanatandharam.com/FileUpload/AD140BEB-AA50-47E5-BDF8-CBA57EEE2BE7.jpeg",
                                "Temple Name"),
                            _carouselItem(
                                context,
                                "https://www.shrisanatandharam.com/FileUpload/11F0762D-BE9E-423F-A5CC-2FF369E05456.jpeg",
                                "Temple Name"),
                            _carouselItem(
                                context,
                                "https://www.shrisanatandharam.com/FileUpload/F5F0178A-4177-4B3D-B76B-894351B1E02D.jpeg",
                                "Temple Name"),
                          ],
                          options: CarouselOptions(
                            height: 200,
                            enlargeCenterPage: true,
                            autoPlayCurve: Curves.easeInOut,
                          )),
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
          myText = _nameController.text;
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

Widget _carouselItem(context, String imgPath, String title) {
  return InkWell(
    onTap: () {
      print("Click event on Container");
      Navigator.pushReplacementNamed(context, "/details");
    },
    child: Stack(
      children: [
        Container(
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
  );
}
