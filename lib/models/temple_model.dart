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
        this.homePageBanners,
        this.homepageTempledetails,
        this.organisationServicesList,
    });

    String retOut;
    String status;
    List<HomePageBanner> homePageBanners;
    HomepageTempledetails homepageTempledetails;
    List<OrganisationServicesList> organisationServicesList;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        retOut: json["retOut"],
        status: json["status"],
        homePageBanners: List<HomePageBanner>.from(json["homePageBanners"].map((x) => HomePageBanner.fromJson(x))),
        homepageTempledetails: HomepageTempledetails.fromJson(json["homepageTempledetails"]),
        organisationServicesList: List<OrganisationServicesList>.from(json["organisationServicesList"].map((x) => OrganisationServicesList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "retOut": retOut,
        "status": status,
        "homePageBanners": List<dynamic>.from(homePageBanners.map((x) => x.toJson())),
        "homepageTempledetails": homepageTempledetails.toJson(),
        "organisationServicesList": List<dynamic>.from(organisationServicesList.map((x) => x.toJson())),
    };
}

class HomePageBanner {
    HomePageBanner({
        this.imageName,
        this.imageTitle,
    });

    String imageName;
    String imageTitle;

    factory HomePageBanner.fromJson(Map<String, dynamic> json) => HomePageBanner(
        imageName: json["imageName"],
        imageTitle: json["imageTitle"],
    );

    Map<String, dynamic> toJson() => {
        "imageName": imageName,
        "imageTitle": imageTitle,
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

class OrganisationServicesList {
    OrganisationServicesList({
        this.orgServiceId,
        this.orgServiceName,
    });

    int orgServiceId;
    String orgServiceName;

    factory OrganisationServicesList.fromJson(Map<String, dynamic> json) => OrganisationServicesList(
        orgServiceId: json["orgServiceID"],
        orgServiceName: json["orgServiceName"],
    );

    Map<String, dynamic> toJson() => {
        "orgServiceID": orgServiceId,
        "orgServiceName": orgServiceName,
    };
}
