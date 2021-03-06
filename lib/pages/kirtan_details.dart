import 'dart:ui';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sanatan_dharam/models/details_kirtan.dart';
import 'package:sanatan_dharam/services/api_manager.dart';

import '../drawer.dart';

class KirtanPage extends StatefulWidget {
  final id;
  KirtanPage({Key key, @required this.id}) : super(key: key);

  @override
  _KirtanPageState createState() => _KirtanPageState(id: this.id);
}

class _KirtanPageState extends State<KirtanPage> {
  final id;
  _KirtanPageState({@required this.id});
  List homepageBanners = [];
  List adBanners = [];
  int index = 0;

  Future<DetailsKirtan> _tDetailsModel;

  // Future<Temples> futureTemples;

  @override
  void initState() {
    super.initState();
    //print(_checkInternetConnectivity());
    _checkInternetConnectivity().then((network) {
      if (network != null && network) {
        if (this.id != null) {
          //print(url);
          _tDetailsModel = API_Manager().getKirtanDetails(this.id);
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

    adBanners = [
      {
        'imagePath': "https://shrisanatandharam.com/front-assets/img/ads2.jpg",
      },
      {
        'imagePath': "https://shrisanatandharam.com/front-assets/img/ads3.jpg",
      },
      {
        'imagePath':
            "https://shrisanatandharam.com/front-assets/img/guruji.jpg",
      },
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
                      FutureBuilder<DetailsKirtan>(
                          future: _tDetailsModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var itemCount =
                                  snapshot.data.kathaKirtanTempleImageList.length;
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: Text(
                                      snapshot.data.kathakirtanns
                                          .title,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  CarouselSlider.builder(
                                      itemCount: itemCount,
                                      itemBuilder: (context, index, realIdx) {
                                        var item = snapshot
                                            .data.kathaKirtanTempleImageList[index];
                                        return _carouselItem(context,
                                            'https://shrisanatandharam.com/FileUpload/'+item.imageName, item.organisationName);
                                      },
                                      options: CarouselOptions(
                                        height: 200,
                                        enlargeCenterPage: true,
                                        autoPlay: true,
                                        autoPlayCurve: Curves.easeInOut,
                                      )),
                                  SizedBox(height: 20),
                                  SizedBox(
                                    height: 35,
                                    width: double.infinity,
                                    child: Text(
                                      "Description:",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Html(data: snapshot
                                          .data.kathakirtanns.fullDesc,
                                          ),
                                    
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      itemCount: adBanners.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                            child: Image.network(
                                          adBanners[index]["imagePath"],
                                          fit: BoxFit.cover,
                                        ));
                                      }),
                                ],
                              );

                              // return Container(
                              //   child: Text(item.organisationName.toString()),
                              // );

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
