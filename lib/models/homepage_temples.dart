// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Temples templesFromJson(String str) => Temples.fromJson(json.decode(str));

String welcomeToJson(Temples data) => json.encode(data.toJson());

class Temples {
    Temples({
        this.retOut,
        this.status,
        this.homePageBanners,
        this.homepageTempledetailModels,
        this.homepageTempleLiveStreamModels,
        this.homepageTempledetailModelgoshalas,
        this.homepageServiceImgList,
        this.chalishaAratiTypeList,
        this.panhangTypeList,
        this.kathaKirtanList,
        this.vedicAcharyaTypeList,
        this.vedicAcharyaLists,
    });

    String retOut;
    String status;
    dynamic homePageBanners;
    List<HomepageTempledetailModel> homepageTempledetailModels;
    dynamic homepageTempleLiveStreamModels;
    dynamic homepageTempledetailModelgoshalas;
    dynamic homepageServiceImgList;
    dynamic chalishaAratiTypeList;
    dynamic panhangTypeList;
    dynamic kathaKirtanList;
    dynamic vedicAcharyaTypeList;
    dynamic vedicAcharyaLists;

    factory Temples.fromJson(Map<String, dynamic> json) => Temples(
        retOut: json["retOut"],
        status: json["status"],
        homePageBanners: json["homePageBanners"],
        homepageTempledetailModels: List<HomepageTempledetailModel>.from(json["homepageTempledetailModels"].map((x) => HomepageTempledetailModel.fromJson(x))),
        homepageTempleLiveStreamModels: json["homepageTempleLiveStreamModels"],
        homepageTempledetailModelgoshalas: json["homepageTempledetailModelgoshalas"],
        homepageServiceImgList: json["homepageServiceImgList"],
        chalishaAratiTypeList: json["chalishaAratiTypeList"],
        panhangTypeList: json["panhangTypeList"],
        kathaKirtanList: json["kathaKirtanList"],
        vedicAcharyaTypeList: json["vedicAcharyaTypeList"],
        vedicAcharyaLists: json["vedicAcharyaLists"],
    );

    Map<String, dynamic> toJson() => {
        "retOut": retOut,
        "status": status,
        "homePageBanners": homePageBanners,
        "homepageTempledetailModels": List<dynamic>.from(homepageTempledetailModels.map((x) => x.toJson())),
        "homepageTempleLiveStreamModels": homepageTempleLiveStreamModels,
        "homepageTempledetailModelgoshalas": homepageTempledetailModelgoshalas,
        "homepageServiceImgList": homepageServiceImgList,
        "chalishaAratiTypeList": chalishaAratiTypeList,
        "panhangTypeList": panhangTypeList,
        "kathaKirtanList": kathaKirtanList,
        "vedicAcharyaTypeList": vedicAcharyaTypeList,
        "vedicAcharyaLists": vedicAcharyaLists,
    };
}

class HomepageTempledetailModel {
    HomepageTempledetailModel({
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
        this.status,
    });

    int organisationId;
    int organisationType;
    int liveStreamType;
    dynamic liveStreamText;
    int configServiceId;
    int id;
    String organisationName;
    dynamic lordName;
    dynamic shortDesc;
    dynamic fullDesc;
    String imageName;
    dynamic liveStreamUrl;
    bool status;

    factory HomepageTempledetailModel.fromJson(Map<String, dynamic> json) => HomepageTempledetailModel(
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
        "status": status,
    };
}
