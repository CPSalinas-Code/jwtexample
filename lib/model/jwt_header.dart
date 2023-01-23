// To parse this JSON data, do
//
//     final jwtHeader = jwtHeaderFromJson(jsonString);

import 'dart:convert';

JwtHeader jwtHeaderFromJson(String str) => JwtHeader.fromJson(json.decode(str));

String jwtHeaderToJson(JwtHeader data) => json.encode(data.toJson());

class JwtHeader {
    JwtHeader({
        required this.typ,
        required this.alg,
    });

    String typ;
    String alg;

    factory JwtHeader.fromJson(Map<String, dynamic> json) => JwtHeader(
        typ: json["typ"],
        alg: json["alg"],
    );

    Map<String, dynamic> toJson() => {
        "typ": typ,
        "alg": alg,
    };
}
