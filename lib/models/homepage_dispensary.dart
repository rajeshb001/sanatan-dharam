// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Dispensary dispensaryFromJson(String str) => Dispensary.fromJson(json.decode(str));

String dispensaryToJson(Dispensary data) => json.encode(data.toJson());

class Dispensary {
    Dispensary({
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
    dynamic homepageTempledetailModels;
    dynamic homepageTempleLiveStreamModels;
    dynamic homepageTempledetailModelgoshalas;
    List<HomepageServiceImgList> homepageServiceImgList;
    dynamic chalishaAratiTypeList;
    dynamic panhangTypeList;
    dynamic kathaKirtanList;
    dynamic vedicAcharyaTypeList;
    dynamic vedicAcharyaLists;

    factory Dispensary.fromJson(Map<String, dynamic> json) => Dispensary(
        retOut: json["retOut"],
        status: json["status"],
        homePageBanners: json["homePageBanners"],
        homepageTempledetailModels: json["homepageTempledetailModels"],
        homepageTempleLiveStreamModels: json["homepageTempleLiveStreamModels"],
        homepageTempledetailModelgoshalas: json["homepageTempledetailModelgoshalas"],
        homepageServiceImgList: List<HomepageServiceImgList>.from(json["homepageServiceImgList"].map((x) => HomepageServiceImgList.fromJson(x))),
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
        "homepageTempledetailModels": homepageTempledetailModels,
        "homepageTempleLiveStreamModels": homepageTempleLiveStreamModels,
        "homepageTempledetailModelgoshalas": homepageTempledetailModelgoshalas,
        "homepageServiceImgList": List<dynamic>.from(homepageServiceImgList.map((x) => x.toJson())),
        "chalishaAratiTypeList": chalishaAratiTypeList,
        "panhangTypeList": panhangTypeList,
        "kathaKirtanList": kathaKirtanList,
        "vedicAcharyaTypeList": vedicAcharyaTypeList,
        "vedicAcharyaLists": vedicAcharyaLists,
    };
}

class HomepageServiceImgList {
    HomepageServiceImgList({
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

    factory HomepageServiceImgList.fromJson(Map<String, dynamic> json) => HomepageServiceImgList(
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
