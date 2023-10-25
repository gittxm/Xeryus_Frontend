import 'dart:convert';

Estado selectAllFromJson(String str) => Estado.fromJson(json.decode(str));

String selectAllToJson(Estado data) => json.encode(data.toJson());

class Estado {
  String? id;
  String? Extension;
  String? estado;
  String? Nombre;
  String? NumeroTelefonico;
  String? TipoNumeroTelefonico;
  String? Activo;
  String? urls;
  Estado({
    this.id,
    this.Extension,
    this.estado,
    this.Nombre,
    this.NumeroTelefonico,
    this.TipoNumeroTelefonico,
    this.Activo,
    this.urls,
  });

  factory Estado.fromJson(Map<String, dynamic> json) => Estado(
        id: json["Id"],
        Extension: json["Extension"],
        estado: json["Estado"],
        Nombre: json["Nombre"],
        NumeroTelefonico: json["NumeroTelefonico"],
        TipoNumeroTelefonico: json["TipoNumeroTelefonico"],
        Activo: json["Activo"],
        urls: json["Urls"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Extension": Extension,
        "Estado": Estado,
        "Nombre": Nombre,
        "NumeroTelefonico": NumeroTelefonico,
        "TipoNumeroTelefonico": TipoNumeroTelefonico,
        "Activo": Activo,
        "Urls": urls,
      };
}
