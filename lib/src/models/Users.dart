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

  User({
    this.id,
    this.alias,
    this.password,
    this.cuentaCorreo,
    this.idioma,
    this.url,
    this.sessionToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        alias: json["alias"],
        password: json["password"],
        cuentaCorreo: json["cuentaCorreo"],
        idioma: json["idioma"],
        url: json["url"],
        sessionToken: json["session_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alias": alias,
        "password": password,
        "cuentaCorreo": cuentaCorreo,
        "idioma": idioma,
        "url": url,
        "session_token": sessionToken,
      };
}
