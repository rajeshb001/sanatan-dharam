// To parse this JSON data, do
//
//     final kathaKirtan = kathaKirtanFromJson(jsonString);

import 'dart:convert';

KathaKirtan kathaKirtanFromJson(String str) => KathaKirtan.fromJson(json.decode(str));

String kathaKirtanToJson(KathaKirtan data) => json.encode(data.toJson());

class KathaKirtan {
    KathaKirtan({
        this.retOut,
        this.status,
        this.kathakirtanns,
    });

    String retOut;
    String status;
    List<Kathakirtann> kathakirtanns;

    factory KathaKirtan.fromJson(Map<String, dynamic> json) => KathaKirtan(
        retOut: json["retOut"],
        status: json["status"],
        kathakirtanns: List<Kathakirtann>.from(json["kathakirtanns"].map((x) => Kathakirtann.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "retOut": retOut,
        "status": status,
        "kathakirtanns": List<dynamic>.from(kathakirtanns.map((x) => x.toJson())),
    };
}

class Kathakirtann {
    Kathakirtann({
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
    String fileName;
    dynamic fileExt;
    String imgName;
    dynamic imgExt;
    int liveStatus;

    factory Kathakirtann.fromJson(Map<String, dynamic> json) => Kathakirtann(
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
