import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sanatan_dharam/constants/strings.dart';
import 'package:sanatan_dharam/models/homepage_dispensary.dart';
import 'package:sanatan_dharam/models/homepage_live.dart';
import 'package:sanatan_dharam/models/homepage_mb.dart';
import 'package:sanatan_dharam/models/homepage_school.dart';
import 'package:sanatan_dharam/models/homepage_temples.dart';
import 'package:sanatan_dharam/models/homepage_gs.dart';
import 'package:sanatan_dharam/models/temple_model.dart';
import 'package:sanatan_dharam/models/homepage_kk.dart';
import 'package:sanatan_dharam/models/details_panchang.dart';
import 'package:sanatan_dharam/models/details_mantra.dart';

// ignore: camel_case_types
class API_Manager {
  List<String> carouselImages;
  Future<Welcome> getNews() async {
    var client = http.Client();
    var liveModel;

    try {
      var response = await client.get(Strings.newsUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        liveModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return liveModel;
    }

    return liveModel;
  }

  Future<Temples> getTemples() async {
    var client = http.Client();
    var templesModel;

    try {
      var response = await client.get(Strings.templesUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        templesModel = Temples.fromJson(jsonMap);
      }
    } catch (Exception) {
      return templesModel;
    }

    return templesModel;
  }

  Future<Marriage> getMarriages() async {
    var client = http.Client();
    var marriageModel;

    try {
      var response = await client.get(Strings.marriageUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        marriageModel = Marriage.fromJson(jsonMap);
      }
    } catch (Exception) {
      return marriageModel;
    }

    return marriageModel;
  }

  Future<Dispensary> getDispensary() async {
    var client = http.Client();
    var dispensaryModel;

    try {
      var response = await client.get(Strings.dispensaryUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        dispensaryModel = Dispensary.fromJson(jsonMap);
      }
    } catch (Exception) {
      return dispensaryModel;
    }

    return dispensaryModel;
  }

  Future<School> getSchool() async {
    var client = http.Client();
    var schoolModel;

    try {
      var response = await client.get(Strings.schoolUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        schoolModel = School.fromJson(jsonMap);
      }
    } catch (Exception) {
      return schoolModel;
    }

    return schoolModel;
  }

  Future<Gs> getGs() async {
    var client = http.Client();
    var gsModel;

    try {
      var response = await client.get(Strings.gsUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        gsModel = Gs.fromJson(jsonMap);
      }
    } catch (Exception) {
      return gsModel;
    }

    return gsModel;
  }

  Future<KathaKirtan> getKirtans() async {
    var client = http.Client();
    var kkModel;

    try {
      var response = await client.get(Strings.kkUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        kkModel = KathaKirtan.fromJson(jsonMap);
      }
    } catch (Exception) {
      return kkModel;
    }

    return kkModel;
  }
  //DETAILS CODE STARTS HERE
  Future<Details> getTempleDetails(int id) async {
    var client = http.Client();
    var tDetails;

    try {
      //print(Strings.detailsUrl+id.toString());
      var response = await client.get(Strings.templeDetailsUrl+id.toString());
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        tDetails = Details.fromJson(jsonMap);
      }
    } catch (Exception) {
      return tDetails;
    }

    return tDetails;
  }
  Future<DetailsPanchang> getPanchangDetails(int id) async {
    var client = http.Client();
    var tDetails;

    try {
      //print(Strings.panchangDetailsUrl+id.toString());
      var response = await client.get(Strings.panchangDetailsUrl+id.toString());
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        tDetails = DetailsPanchang.fromJson(jsonMap);
      }
    } catch (Exception) {
      return tDetails;
    }

    return tDetails;
  }
  Future<DetailsMantra> getMantraDetails(int id) async {
    var client = http.Client();
    var tDetails;

    try {
      //print(Strings.panchangDetailsUrl+id.toString());
      var response = await client.get(Strings.mantraDetailsUrl+id.toString());
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        tDetails = DetailsMantra.fromJson(jsonMap);
      }
    } catch (Exception) {
      return tDetails;
    }

    return tDetails;
  }


}
