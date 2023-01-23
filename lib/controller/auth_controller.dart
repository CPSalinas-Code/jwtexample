import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_examplo/model/jwt_payload.dart';
import 'package:jwt_examplo/model/jwt_header.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:jwt_decode/jwt_decode.dart';


class AuthController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static const String semilla = 'AyM1SysPpbyDfgZld3umj1qzKObwVMko';

  Future loginUser() async {
    /*final _url = 'http://192.168.0.106:8080';
    var response = await http.post(Uri.parse(_url),body: jsonEncode({
    "username":userController.text,
    "password":passwordController,
  }));
  if(response.statusCode==200){
    var loginArr = json.decode(response.body);
    debugPrint(loginArr);
  }else{

    debugPrint("Login Error");
  }*/

    JwtHeader jwtHeader = JwtHeader(
      typ: "JWT",
      alg: "HS256",
    );

    JwtModel jwtPayload = JwtModel(
        iss: "ec.fin.baustro",
        sub: "ec.fin.baustro.sesion",
        ip: "190.63.184.46",
        username: userController.text,
        uuid:
            "Android,984725b6c4f55963cc52fca0f943f9a8060b1c71900d542c79669b6dc718a64b",
        hash:
            "b4c7f91e0dbdf12e5017a3929b937b3b3455ffeed4da5090154624cc739c8a425JdlvdbJtNeuh6GJHTfUjwFbWCUEqwQgw54wNo1vyvouo25gNeyz21lbClBiORjWyakb+cU1LEzHcLytbBTI2EiV0U38BskloMlWxgWCL3jjxu+y62WekMEgAw1Cb/HjSA93qHN+pM3Nx3Tqs7DHP1SdpXxtY6ZQ/iJuEcphs/xE/ZpLFQnFAcKY5AXhgWbS",
        exp: 1674175569,
        iat: 1672861569,
        jti: "0d00d80d-5792-4db5-ab87-8c794dfc4a55");

    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encodedHeader = (stringToBase64.encode(jwtHeader.toString()));
    debugPrint("!!!........." + encodedHeader + "............!!!");

    String encodedPayload = (stringToBase64.encode(jwtPayload.toString()));
    debugPrint("!!!........." + encodedPayload + "............!!!");

    final jwt = JWT(
      jwtPayload
      // Payload
      /*{
        "iss": "ec.fin.baustro",
        "sub": "ec.fin.baustro.sesion",
        "ip": "190.63.184.46",
        "username": "hugito123456",
        "uuid":
            "Android,984725b6c4f55963cc52fca0f943f9a8060b1c71900d542c79669b6dc718a64b",
        "hash":
            "b4c7f91e0dbdf12e5017a3929b937b3b3455ffeed4da5090154624cc739c8a425JdlvdbJtNeuh6GJHTfUjwFbWCUEqwQgw54wNo1vyvouo25gNeyz21lbClBiORjWyakb+cU1LEzHcLytbBTI2EiV0U38BskloMlWxgWCL3jjxu+y62WekMEgAw1Cb/HjSA93qHN+pM3Nx3Tqs7DHP1SdpXxtY6ZQ/iJuEcphs/xE/ZpLFQnFAcKY5AXhgWbS",
        "exp": 1674175569,
        "iat": 1672861569,
        "jti": "0d00d80d-5792-4db5-ab87-8c794dfc4a55"
      }*/
      
      /*subject: 'ec.fin.baustro.sesion',
      jwtId:'jwtiiidd' ,
      issuer: 'ec.fin.baustro'*/
    );

// default HS256 algoritmo
    var token = jwt.sign(SecretKey('AyM1SysPpbyDfgZld3umj1qzKObwVMko'));

    debugPrint('Signed token: $token\n');


    Map<String, dynamic> payload = Jwt.parseJwt(token);

    debugPrint(payload.toString());
  }
}

class IpInfoApi {
  static Future<String?> getIPAddress()async {
    try{
    final url = Uri.parse('https://api.ipify.org');
    final response = await http.get(url);
  return response.statusCode==200 ? response.body : null;
    }catch (e){
      return null;
    }
  }
}