// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
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
    List<HomepageTempleLiveStreamModel> homepageTempleLiveStreamModels;
    dynamic homepageTempledetailModelgoshalas;
    dynamic homepageServiceImgList;
    dynamic chalishaAratiTypeList;
    dynamic panhangTypeList;
    dynamic kathaKirtanList;
    dynamic vedicAcharyaTypeList;
    dynamic vedicAcharyaLists;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        retOut: json["retOut"],
        status: json["status"],
        homePageBanners: json["homePageBanners"],
        homepageTempledetailModels: json["homepageTempledetailModels"],
        homepageTempleLiveStreamModels: List<HomepageTempleLiveStreamModel>.from(json["homepageTempleLiveStreamModels"].map((x) => HomepageTempleLiveStreamModel.fromJson(x))),
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
        "homepageTempledetailModels": homepageTempledetailModels,
        "homepageTempleLiveStreamModels": List<dynamic>.from(homepageTempleLiveStreamModels.map((x) => x.toJson())),
        "homepageTempledetailModelgoshalas": homepageTempledetailModelgoshalas,
        "homepageServiceImgList": homepageServiceImgList,
        "chalishaAratiTypeList": chalishaAratiTypeList,
        "panhangTypeList": panhangTypeList,
        "kathaKirtanList": kathaKirtanList,
        "vedicAcharyaTypeList": vedicAcharyaTypeList,
        "vedicAcharyaLists": vedicAcharyaLists,
    };
}

class HomepageTempleLiveStreamModel {
    HomepageTempleLiveStreamModel({
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
    String liveStreamText;
    int configServiceId;
    int id;
    String organisationName;
    dynamic lordName;
    String shortDesc;
    String fullDesc;
    String imageName;
    dynamic liveStreamUrl;
    bool status;

    factory HomepageTempleLiveStreamModel.fromJson(Map<String, dynamic> json) => HomepageTempleLiveStreamModel(
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
