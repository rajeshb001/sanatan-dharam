// To parse this JSON data, do
//
//     final details = detailsFromJson(jsonString);

import 'dart:convert';

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

String detailsToJson(Details data) => json.encode(data.toJson());

class Details {
    Details({
        this.retOut,
        this.status,
        this.homepageTempledetail,
        this.organisationServiceList,
        this.sliderImageList,
    });

    String retOut;
    String status;
    HomepageTempledetail homepageTempledetail;
    List<OrganisationServiceList> organisationServiceList;
    List<SliderImageList> sliderImageList;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        retOut: json["retOut"],
        status: json["status"],
        homepageTempledetail: HomepageTempledetail.fromJson(json["homepageTempledetail"]),
        organisationServiceList: List<OrganisationServiceList>.from(json["organisationServiceList"].map((x) => OrganisationServiceList.fromJson(x))),
        sliderImageList: List<SliderImageList>.from(json["sliderImageList"].map((x) => SliderImageList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "retOut": retOut,
        "status": status,
        "homepageTempledetail": homepageTempledetail.toJson(),
        "organisationServiceList": List<dynamic>.from(organisationServiceList.map((x) => x.toJson())),
        "sliderImageList": List<dynamic>.from(sliderImageList.map((x) => x.toJson())),
    };
}

class HomepageTempledetail {
    HomepageTempledetail({
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
    String lordName;
    String shortDesc;
    String fullDesc;
    dynamic imageName;
    dynamic liveStreamUrl;
    bool status;

    factory HomepageTempledetail.fromJson(Map<String, dynamic> json) => HomepageTempledetail(
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

class OrganisationServiceList {
    OrganisationServiceList({
        this.orgServiceId,
        this.orgServiceName,
    });

    int orgServiceId;
    String orgServiceName;

    factory OrganisationServiceList.fromJson(Map<String, dynamic> json) => OrganisationServiceList(
        orgServiceId: json["orgServiceID"],
        orgServiceName: json["orgServiceName"],
    );

    Map<String, dynamic> toJson() => {
        "orgServiceID": orgServiceId,
        "orgServiceName": orgServiceName,
    };
}

class SliderImageList {
    SliderImageList({
        this.imageName,
        this.imageTitle,
    });

    String imageName;
    String imageTitle;

    factory SliderImageList.fromJson(Map<String, dynamic> json) => SliderImageList(
        imageName: json["imageName"],
        imageTitle: json["imageTitle"],
    );

    Map<String, dynamic> toJson() => {
        "imageName": imageName,
        "imageTitle": imageTitle,
    };
}
