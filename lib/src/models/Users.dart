import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? alias;
  String? password;
  String? cuentaCorreo;
  String? idioma;
  String? url;
  String? sessionToken;
  String? extension;

  User({
    this.id,
    this.alias,
    this.password,
    this.cuentaCorreo,
    this.idioma,
    this.url,
    this.sessionToken,
    this.extension,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        alias: json["alias"].toString(),
        password: json["password"],
        cuentaCorreo: json["cuentaCorreo"],
        idioma: json["idioma"],
        url: json["url"],
        sessionToken: json["session_token"],
        extension: json["Extension"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alias": alias,
        "password": password,
        "cuentaCorreo": cuentaCorreo,
        "idioma": idioma,
        "url": url,
        "session_token": sessionToken,
        "Extension": extension,
      };
}
