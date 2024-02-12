// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

Extensionn extensionFromJson(String str) =>
    Extensionn.fromJson(json.decode(str));

String extensionToJson(Extensionn data) => json.encode(data.toJson());

class Extensionn {
  String? extension;
  String? estadoExtension;
  String? numeroDestino;
  String? tipoDesvio;
  String? Extension;
  String? Estado;
  String? Nombre;
  String? NumeroTelefonico;
  String? TipoNumeroTelefonico;
  String? Activo;
  String? Numero;
  String? Usuario;
  dynamic data;
  Extensionn({
    this.extension,
    this.estadoExtension,
    this.numeroDestino,
    this.tipoDesvio,
    this.Extension,
    this.Estado,
    this.Nombre,
    this.NumeroTelefonico,
    this.TipoNumeroTelefonico,
    this.Activo,
    this.Numero,
    this.Usuario,
    this.data,
  });

  factory Extensionn.fromJson(Map<String, dynamic> json) => Extensionn(
        extension: json["Extension"].toString(),
        estadoExtension: json["EstadoExtension"].toString(),
        numeroDestino: json["NumeroDestino"],
        tipoDesvio: json["TipoDesvio"].toString(),
        Extension: json["Extension"].toString(),
        Estado: json["Estado"].toString(),
        Nombre: json["Nombre"].toString(),
        NumeroTelefonico: json["NumeroTelefonico"].toString(),
        TipoNumeroTelefonico: json["TipoNumeroTelefonico"].toString(),
        Activo: json['Activo'].toString(),
        Numero: json['numero'].toString(),
        Usuario: json["Usuario"],
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        "Extension2": extension,
        "EstadoExtension": estadoExtension,
        "NumeroDestino": numeroDestino,
        "TipoDesvio": tipoDesvio,
        "Extension": Extension,
        "Estado": Estado,
        "Nombre": Nombre,
        "NumeroTelefonico": NumeroTelefonico,
        "TipoNumeroTelefonico": TipoNumeroTelefonico,
        "Activo": Activo,
        "numero": Numero,
        "Usuario": Usuario,
        "data": data,
      };
}
