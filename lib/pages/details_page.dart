import 'package:flutter/material.dart';
import 'package:sanatan_dharam/models/temple_model.dart';
import 'package:sanatan_dharam/utils/Constants.dart';
import 'package:sanatan_dharam/services/api_manager.dart';

import '../drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailsPage extends StatefulWidget {
  final id;
  DetailsPage({Key key, @required this.id}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState(id: this.id);
}

class _DetailsPageState extends State<DetailsPage> {
  final id;
  _DetailsPageState({@required this.id});
  var url = "https://www.shrisanatandharam.com/api/home/HomePageDetails?orid=";

  var data;
  List homepageBanners = [];
  int index = 0;

 Future<Details> _tDetailsModel;

  
 

  @override
  void initState() {
    super.initState();
    if (this.id != null) {
      //print(url);
      _tDetailsModel = API_Manager().getTempleDetails(this.id);
      //print(_tDetailsModel);
      //getData();
    }
  }

  getData() async {
    //url += this.id;
    //url += this.id.toString();
    //var res = await http.get(url);
    //data = jsonDecode(res.body);
    //print(url);
    //print(this.id);

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
//
    //data = data['homepageTempledetailModels'];
    //print(data);
    setState(() {});
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
                Constants.prefs.setBool("loggedin", false);
                Navigator.pushReplacementNamed(context, "/login");
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
            child: _tDetailsModel != null
                ? Column(
                    children: [
                      SizedBox(
                        height: 35,
                        width: double.infinity,
                        child: Text(
                          "text",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.shrisanatandharam.com/FileUpload/F5F0178A-4177-4B3D-B76B-894351B1E02D.jpeg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
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
                        child: Text(
                          "Hanuman Temple in Connaught Place, New Delhi. Is an ancient (pracheen in Sanskrit) Hindu temple and is claimed to be one of the five temples of Mahabharata days in Delhi. The idol in the temple, devotionally worshipped as “Sri Hanuman Ji Maharaj” (Great Lord Hanuman), is that of Bala Hanuman namely, Hanuman as a child. The temple, which has a self manifest idol of Hanuman, has an unusual feature fixed in the spire (Viman) in the form of a crescent moon (an Islamic symbol) instead of the Hindu symbol of Aum or Sun that is commonly seen in most Hindu temples. This became particularly important during the Mughal period corroborating this extraordinary depiction.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          
                        ),
                      ),
                      SizedBox(height: 10,),
                       SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Historically, Delhi located on the banks of the Yamuna River has been stated to be the Indraprastha city built by Pandavas of the Mahabharata epic period. In the Mahabharata days, Pandavas ruled from Indraprastha and Kauravas from Hastinapur (two collateral families) as per a brokered partition of the Kuru empire. But, in a dice game, Pandavas lost their Kingdom and were exiled for a 12 year term and in the 13th year must remain in hiding (with a rider that if they were detected during this period they would undergo the exile denovo). Mythological legend states that during the Pandavas’ exile (imposed by their cousin Duryodhana of the Kaurava dynasty), in order to subdue Bhima’s (second of the five Pandava brothers) arrogance, Hanuman considered to be the brother of Bhima (both Vayu’s children, appeared in the forest disguised as a weak and aged monkey. Bhima, while in search of a fragrant flower sought by Draupadi in the forest, found Hanuman lying with his tail blocking his way and, unaware of Hanuman’s identity, scornfully asked him to remove his tail. But Hanuman told Bhima to lift the tail since being old he was unable to do it on his own. Bhima tried hard several times but failed to lift it, in spite of being a man of great strength. Bhima then realized that the monkey was none other his own brother, apologizes for his arrogant behavior and requests Hanuman to show him his true form. ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          
                        ),
                      ),                     
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
          Navigator.pushReplacementNamed(context, "/details");
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }


}
