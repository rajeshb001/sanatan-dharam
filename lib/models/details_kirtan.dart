// To parse this JSON data, do
//
//     final detailsKirtan = detailsKirtanFromJson(jsonString);

import 'dart:convert';

DetailsKirtan detailsKirtanFromJson(String str) => DetailsKirtan.fromJson(json.decode(str));

String detailsKirtanToJson(DetailsKirtan data) => json.encode(data.toJson());

class DetailsKirtan {
    DetailsKirtan({
        this.retOut,
        this.status,
        this.kathaKirtanTempleImageList,
        this.kathakirtanns,
    });

    String retOut;
    String status;
    List<KathaKirtanTempleImageList> kathaKirtanTempleImageList;
    Kathakirtanns kathakirtanns;

    factory DetailsKirtan.fromJson(Map<String, dynamic> json) => DetailsKirtan(
        retOut: json["retOut"],
        status: json["status"],
        kathaKirtanTempleImageList: List<KathaKirtanTempleImageList>.from(json["kathaKirtanTempleImageList"].map((x) => KathaKirtanTempleImageList.fromJson(x))),
        kathakirtanns: Kathakirtanns.fromJson(json["kathakirtanns"]),
    );

    Map<String, dynamic> toJson() => {
        "retOut": retOut,
        "status": status,
        "kathaKirtanTempleImageList": List<dynamic>.from(kathaKirtanTempleImageList.map((x) => x.toJson())),
        "kathakirtanns": kathakirtanns.toJson(),
    };
}

class KathaKirtanTempleImageList {
    KathaKirtanTempleImageList({
        this.organisationName,
        this.imageName,
    });

    String organisationName;
    String imageName;

    factory KathaKirtanTempleImageList.fromJson(Map<String, dynamic> json) => KathaKirtanTempleImageList(
        organisationName: json["organisationName"],
        imageName: json["imageName"],
    );

    Map<String, dynamic> toJson() => {
        "organisationName": organisationName,
        "imageName": imageName,
    };
}

class Kathakirtanns {
    Kathakirtanns({
        this.id,
        this.uploadDate,
        this.organisationId,
        this.title,
        this.fullDesc,
        this.fileName,
        this.fileExt,
        this.imgName,
        this.imgExt,
        this.liveStatus,
    });

    int id;
    DateTime uploadDate;
    int organisationId;
    String title;
    String fullDesc;
    dynamic fileName;
    dynamic fileExt;
    dynamic imgName;
    dynamic imgExt;
    int liveStatus;

    factory Kathakirtanns.fromJson(Map<String, dynamic> json) => Kathakirtanns(
        id: json["id"],
        uploadDate: DateTime.parse(json["uploadDate"]),
        organisationId: json["organisationId"],
        title: json["title"],
        fullDesc: json["fullDesc"],
        fileName: json["fileName"],
        fileExt: json["fileExt"],
        imgName: json["imgName"],
        imgExt: json["imgExt"],
        liveStatus: json["liveStatus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uploadDate": uploadDate.toIso8601String(),
        "organisationId": organisationId,
        "title": title,
        "fullDesc": fullDesc,
        "fileName": fileName,
        "fileExt": fileExt,
        "imgName": imgName,
        "imgExt": imgExt,
        "liveStatus": liveStatus,
    };
}
