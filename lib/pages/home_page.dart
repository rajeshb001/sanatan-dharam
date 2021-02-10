import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:sanatan_dharam/models/homepage_gs.dart';
import 'package:sanatan_dharam/models/homepage_school.dart';
import 'package:sanatan_dharam/models/homepage_temples.dart';
import 'package:sanatan_dharam/utils/Constants.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sanatan_dharam/models/homepage_live.dart';
import 'package:sanatan_dharam/models/homepage_mb.dart';
import 'package:sanatan_dharam/models/homepage_dispensary.dart';
import 'package:sanatan_dharam/services/api_manager.dart';

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
    var res = await http.get(url);
    data = jsonDecode(res.body);

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
                            "LIVE DARSHAN",
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
                      FutureBuilder<Welcome>(
                          future: _welcomeModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var itemCount = snapshot
                                  .data.homepageTempleLiveStreamModels.length;
                              return CarouselSlider.builder(
                                  itemCount: itemCount,
                                  itemBuilder: (context, index, realIdx) {
                                    var item = snapshot.data
                                        .homepageTempleLiveStreamModels[index];
                                    return _carouselItem(
                                        context,
                                        "https://www.shrisanatandharam.com/FileUpload/" +
                                            item.imageName,
                                        item.organisationName);
                                  },
                                  options: CarouselOptions(
                                    height: 200,
                                    enlargeCenterPage: true,
                                    autoPlayCurve: Curves.easeInOut,
                                  ));

                              // return Container(
                              //   child: Text(item.organisationName.toString()),
                              // );

                            }
                            return CircularProgressIndicator();
                          }),
                      SizedBox(height: 40),
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
                      FutureBuilder<Temples>(
                          future: _templesModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var itemCount = snapshot
                                  .data.homepageTempledetailModels.length;
                              return CarouselSlider.builder(
                                  itemCount: itemCount,
                                  itemBuilder: (context, index, realIdx) {
                                    var item = snapshot.data
                                        .homepageTempledetailModels[index];
                                    return _carouselItem(
                                        context,item.imageName,item.organisationName);
                                  },
                                  options: CarouselOptions(
                                    height: 200,
                                    enlargeCenterPage: true,
                                    autoPlayCurve: Curves.easeInOut,
                                  ));
                            }
                            return CircularProgressIndicator();
                          }),
                      SizedBox(height: 40),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "MARRIAGE BUREAU",
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
                      FutureBuilder<Marriage>(
                          future: _marriageModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var itemCount = snapshot
                                  .data.homepageServiceImgList.length;
                              return CarouselSlider.builder(
                                  itemCount: itemCount,
                                  itemBuilder: (context, index, realIdx) {
                                    var item = snapshot.data
                                        .homepageServiceImgList[index];
                                    return _carouselItem(
                                        context,item.imageName,item.organisationName);
                                  },
                                  options: CarouselOptions(
                                    height: 200,
                                    enlargeCenterPage: true,
                                    autoPlayCurve: Curves.easeInOut,
                                  ));
                            }
                            return CircularProgressIndicator();
                          }),
                      SizedBox(height: 40),    
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "DISPANSARY / PATHO LAB",
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
                      FutureBuilder<Dispensary>(
                          future: _dispensaryModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var itemCount = snapshot
                                  .data.homepageServiceImgList.length;
                              return CarouselSlider.builder(
                                  itemCount: itemCount,
                                  itemBuilder: (context, index, realIdx) {
                                    var item = snapshot.data
                                        .homepageServiceImgList[index];
                                    return _carouselItem(
                                        context,item.imageName,item.organisationName);
                                  },
                                  options: CarouselOptions(
                                    height: 200,
                                    enlargeCenterPage: true,
                                    autoPlayCurve: Curves.easeInOut,
                                  ));
                            }
                            return CircularProgressIndicator();
                          }),
                      SizedBox(height: 40),                   
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "SCHOOL/INSTITUTION",
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
                      FutureBuilder<School>(
                          future: _schoolModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var itemCount = snapshot
                                  .data.homepageServiceImgList.length;
                              return CarouselSlider.builder(
                                  itemCount: itemCount,
                                  itemBuilder: (context, index, realIdx) {
                                    var item = snapshot.data
                                        .homepageServiceImgList[index];
                                    return _carouselItem(
                                        context,item.imageName,item.organisationName);
                                  },
                                  options: CarouselOptions(
                                    height: 200,
                                    enlargeCenterPage: true,
                                    autoPlayCurve: Curves.easeInOut,
                                  ));
                            }
                            return CircularProgressIndicator();
                          }),
                      SizedBox(height: 40),  
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "GAUSHALA",
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
                      FutureBuilder<Gs>(
                          future: _gsModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var itemCount = snapshot
                                  .data.homepageServiceImgList.length;
                              return CarouselSlider.builder(
                                  itemCount: itemCount,
                                  itemBuilder: (context, index, realIdx) {
                                    var item = snapshot.data
                                        .homepageServiceImgList[index];
                                    return _carouselItem(
                                        context,item.imageName,item.organisationName);
                                  },
                                  options: CarouselOptions(
                                    height: 200,
                                    enlargeCenterPage: true,
                                    autoPlayCurve: Curves.easeInOut,
                                  ));
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
