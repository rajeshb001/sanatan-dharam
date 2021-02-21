// To parse this JSON data, do
//
//     final detailsMantra = detailsMantraFromJson(jsonString);

import 'dart:convert';

DetailsMantra detailsMantraFromJson(String str) => DetailsMantra.fromJson(json.decode(str));

String detailsMantraToJson(DetailsMantra data) => json.encode(data.toJson());

class DetailsMantra {
    DetailsMantra({
        this.retOut,
        this.status,
        this.chalishaAratiList,
        this.chalishaAratiPdf,
    });

    String retOut;
    String status;
    List<ChalishaAratiList> chalishaAratiList;
    dynamic chalishaAratiPdf;

    factory DetailsMantra.fromJson(Map<String, dynamic> json) => DetailsMantra(
        retOut: json["retOut"],
        status: json["status"],
        chalishaAratiList: List<ChalishaAratiList>.from(json["chalishaAratiList"].map((x) => ChalishaAratiList.fromJson(x))),
        chalishaAratiPdf: json["chalishaAratiPDF"],
    );

    Map<String, dynamic> toJson() => {
        "retOut": retOut,
        "status": status,
        "chalishaAratiList": List<dynamic>.from(chalishaAratiList.map((x) => x.toJson())),
        "chalishaAratiPDF": chalishaAratiPdf,
    };
}

class ChalishaAratiList {
    ChalishaAratiList({
        this.id,
        this.chalishaAratiType,
        this.title,
        this.fullDesc,
        this.fileName,
        this.imgName,
        this.fileExt,
        this.imgExt,
        this.type,
    });

    int id;
    int chalishaAratiType;
    String title;
    dynamic fullDesc;
    String fileName;
    dynamic imgName;
    dynamic fileExt;
    dynamic imgExt;
    Type type;

    factory ChalishaAratiList.fromJson(Map<String, dynamic> json) => ChalishaAratiList(
        id: json["id"],
        chalishaAratiType: json["chalishaAratiType"],
        title: json["title"],
        fullDesc: json["fullDesc"],
        fileName: json["fileName"],
        imgName: json["imgName"],
        fileExt: json["fileExt"],
        imgExt: json["imgExt"],
        type: typeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "chalishaAratiType": chalishaAratiType,
        "title": title,
        "fullDesc": fullDesc,
        "fileName": fileName,
        "imgName": imgName,
        "fileExt": fileExt,
        "imgExt": imgExt,
        "type": typeValues.reverse[type],
    };
}

enum Type { CHALISHA }

final typeValues = EnumValues({
    "Chalisha": Type.CHALISHA
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
