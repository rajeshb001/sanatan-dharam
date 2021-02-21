// To parse this JSON data, do
//
//     final detailsPanchang = detailsPanchangFromJson(jsonString);

import 'dart:convert';

DetailsPanchang detailsPanchangFromJson(String str) => DetailsPanchang.fromJson(json.decode(str));

String detailsPanchangToJson(DetailsPanchang data) => json.encode(data.toJson());

class DetailsPanchang {
    DetailsPanchang({
        this.retOut,
        this.status,
        this.panchanglist,
    });

    String retOut;
    String status;
    List<Panchanglist> panchanglist;

    factory DetailsPanchang.fromJson(Map<String, dynamic> json) => DetailsPanchang(
        retOut: json["retOut"],
        status: json["status"],
        panchanglist: List<Panchanglist>.from(json["panchanglist"].map((x) => Panchanglist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "retOut": retOut,
        "status": status,
        "panchanglist": List<dynamic>.from(panchanglist.map((x) => x.toJson())),
    };
}

class Panchanglist {
    Panchanglist({
        this.id,
        this.panchangType,
        this.title,
        this.fullDesc,
    });

    int id;
    int panchangType;
    String title;
    String fullDesc;

    factory Panchanglist.fromJson(Map<String, dynamic> json) => Panchanglist(
        id: json["id"],
        panchangType: json["panchangType"],
        title: json["title"],
        fullDesc: json["fullDesc"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "panchangType": panchangType,
        "title": title,
        "fullDesc": fullDesc,
    };
}
