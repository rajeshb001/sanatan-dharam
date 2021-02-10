import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sanatan_dharam/constants/strings.dart';
import 'package:sanatan_dharam/models/homepage_dispensary.dart';
import 'package:sanatan_dharam/models/homepage_live.dart';
import 'package:sanatan_dharam/models/homepage_mb.dart';
import 'package:sanatan_dharam/models/homepage_school.dart';
import 'package:sanatan_dharam/models/homepage_temples.dart';
import 'package:sanatan_dharam/models/homepage_gs.dart';

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

}
