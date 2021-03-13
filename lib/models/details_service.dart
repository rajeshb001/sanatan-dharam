// To parse this JSON data, do
//
//     final detailsService = detailsServiceFromJson(jsonString);

import 'dart:convert';

DetailsService detailsServiceFromJson(String str) => DetailsService.fromJson(json.decode(str));

String detailsServiceToJson(DetailsService data) => json.encode(data.toJson());

class DetailsService {
    DetailsService({
        this.retOut,
        this.status,
        this.serviceDetailModel,
        this.servicePageModelImg,
        this.serviceDetailModelLists,
    });

    String retOut;
    String status;
    dynamic serviceDetailModel;
    List<ServicePageModelImg> servicePageModelImg;
    List<ServiceDetailModelList> serviceDetailModelLists;

    factory DetailsService.fromJson(Map<String, dynamic> json) => DetailsService(
        retOut: json["retOut"],
        status: json["status"],
        serviceDetailModel: json["serviceDetailModel"],
        servicePageModelImg: List<ServicePageModelImg>.from(json["servicePageModelImg"].map((x) => ServicePageModelImg.fromJson(x))),
        serviceDetailModelLists: List<ServiceDetailModelList>.from(json["serviceDetailModelLists"].map((x) => ServiceDetailModelList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "retOut": retOut,
        "status": status,
        "serviceDetailModel": serviceDetailModel,
        "servicePageModelImg": List<dynamic>.from(servicePageModelImg.map((x) => x.toJson())),
        "serviceDetailModelLists": List<dynamic>.from(serviceDetailModelLists.map((x) => x.toJson())),
    };
}

class ServiceDetailModelList {
    ServiceDetailModelList({
        this.organisationId,
        this.id,
        this.nameTitle,
        this.shortDesc,
        this.fullDesc,
    });

    int organisationId;
    int id;
    String nameTitle;
    String shortDesc;
    String fullDesc;

    factory ServiceDetailModelList.fromJson(Map<String, dynamic> json) => ServiceDetailModelList(
        organisationId: json["organisationId"],
        id: json["id"],
        nameTitle: json["nameTitle"],
        shortDesc: json["shortDesc"],
        fullDesc: json["fullDesc"],
    );

    Map<String, dynamic> toJson() => {
        "organisationId": organisationId,
        "id": id,
        "nameTitle": nameTitle,
        "shortDesc": shortDesc,
        "fullDesc": fullDesc,
    };
}

class ServicePageModelImg {
    ServicePageModelImg({
        this.imageName,
        this.imageTitle,
    });

    String imageName;
    String imageTitle;

    factory ServicePageModelImg.fromJson(Map<String, dynamic> json) => ServicePageModelImg(
        imageName: json["imageName"],
        imageTitle: json["imageTitle"],
    );

    Map<String, dynamic> toJson() => {
        "imageName": imageName,
        "imageTitle": imageTitle,
    };
}
