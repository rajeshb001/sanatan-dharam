// To parse this JSON data, do
//
//     final sdp = sdpFromJson(jsonString);

import 'dart:convert';

Sdp sdpFromJson(String str) => Sdp.fromJson(json.decode(str));

String sdpToJson(Sdp data) => json.encode(data.toJson());

class Sdp {
    Sdp({
        this.retOut,
        this.status,
        this.sdp,
    });

    String retOut;
    String status;
    String sdp;

    factory Sdp.fromJson(Map<String, dynamic> json) => Sdp(
        retOut: json["retOut"],
        status: json["status"],
        sdp: json["sdp"],
    );

    Map<String, dynamic> toJson() => {
        "retOut": retOut,
        "status": status,
        "sdp": sdp,
    };
}
