// To parse this JSON data, do
//
//     final jwtModel = jwtModelFromJson(jsonString);

import 'dart:convert';

JwtModel jwtModelFromJson(String str) => JwtModel.fromJson(json.decode(str));

String jwtModelToJson(JwtModel data) => json.encode(data.toJson());

class JwtModel {
    JwtModel({
        required this.iss,
        required this.sub,
        required this.ip,
        required this.username,
        required this.uuid,
        required this.hash,
        required this.exp,
        required this.iat,
        required this.jti,
    });

    String iss;
    String sub;
    String ip;
    String username;
    String uuid;
    String hash;
    int exp;
    int iat;
    String jti;

    factory JwtModel.fromJson(Map<String, dynamic> json) => JwtModel(
        iss: json["iss"],
        sub: json["sub"],
        ip: json["ip"],
        username: json["username"],
        uuid: json["UUID"],
        hash: json["hash"],
        exp: json["exp"],
        iat: json["iat"],
        jti: json["jti"],
    );

    Map<String, dynamic> toJson() => {
        "iss": iss,
        "sub": sub,
        "ip": ip,
        "username": username,
        "UUID": uuid,
        "hash": hash,
        "exp": exp,
        "iat": iat,
        "jti": jti,
    };
}
