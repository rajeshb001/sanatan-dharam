// To parse this JSON data, do
//
//     final liveDetails = liveDetailsFromJson(jsonString);

import 'dart:convert';

LiveDetails liveDetailsFromJson(String str) => LiveDetails.fromJson(json.decode(str));

String liveDetailsToJson(LiveDetails data) => json.encode(data.toJson());

class LiveDetails {
    LiveDetails({
        this.retOut,
        this.status,
        this.homePageBanners,
        this.homepageTempledetails,
        this.organisationServicesList,
    });

    String retOut;
    String status;
    dynamic homePageBanners;
    HomepageTempledetails homepageTempledetails;
    dynamic organisationServicesList;

    factory LiveDetails.fromJson(Map<String, dynamic> json) => LiveDetails(
        retOut: json["retOut"],
        status: json["status"],
        homePageBanners: json["homePageBanners"],
        homepageTempledetails: HomepageTempledetails.fromJson(json["homepageTempledetails"]),
        organisationServicesList: json["organisationServicesList"],
    );

    Map<String, dynamic> toJson() => {
        "retOut": retOut,
        "status": status,
        "homePageBanners": homePageBanners,
        "homepageTempledetails": homepageTempledetails.toJson(),
        "organisationServicesList": organisationServicesList,
    };
}

class HomepageTempledetails {
    HomepageTempledetails({
        this.organisationId,
        this.organisationType,
        this.liveStreamType,
        this.liveStreamText,
        this.configServiceId,
        this.id,
        this.organisationName,
        this.lordName,
        this.shortDesc,
        this.fullDesc,
        this.imageName,
        this.liveStreamUrl,
        this.url,
        this.status,
    });

    int organisationId;
    int organisationType;
    int liveStreamType;
    String liveStreamText;
    int configServiceId;
    int id;
    String organisationName;
    String lordName;
    String shortDesc;
    String fullDesc;
    dynamic imageName;
    String liveStreamUrl;
    String url;
    bool status;

    factory HomepageTempledetails.fromJson(Map<String, dynamic> json) => HomepageTempledetails(
        organisationId: json["organisationId"],
        organisationType: json["organisationType"],
        liveStreamType: json["liveStreamType"],
        liveStreamText: json["liveStreamText"],
        configServiceId: json["configServiceId"],
        id: json["id"],
        organisationName: json["organisationName"],
        lordName: json["lordName"],
        shortDesc: json["shortDesc"],
        fullDesc: json["fullDesc"],
        imageName: json["imageName"],
        liveStreamUrl: json["liveStreamURL"],
        url: json["url"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "organisationId": organisationId,
        "organisationType": organisationType,
        "liveStreamType": liveStreamType,
        "liveStreamText": liveStreamText,
        "configServiceId": configServiceId,
        "id": id,
        "organisationName": organisationName,
        "lordName": lordName,
        "shortDesc": shortDesc,
        "fullDesc": fullDesc,
        "imageName": imageName,
        "liveStreamURL": liveStreamUrl,
        "url": url,
        "status": status,
    };
}
