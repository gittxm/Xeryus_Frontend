import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Extension extensionFromJson(String str) => Extension.fromJson(json.decode(str));

String extensionToJson(Extension data) => json.encode(data.toJson());

class Extension {
  String? extension;
  String? estadoExtension;
  String? Nombre;
  String? NumeroTelefonico;
  String? Estado;
  String? numeroDestino;
  String? tipoDesvio;
  dynamic data;
  Extension({
    this.extension,
    this.estadoExtension,
    this.Nombre,
    this.NumeroTelefonico,
    this.Estado,
    this.numeroDestino,
    this.tipoDesvio,
    this.data,
  });

  factory Extension.fromJson(Map<String, dynamic> json) => Extension(
        extension: json["Extension"].toString(),
        estadoExtension: json["EstadoExtension"].toString(),
        Nombre: json["Nombre"].toString(),
        NumeroTelefonico: json["NumeroTelefonico"].toString(),
        Estado: json["Estado"].toString(),
        numeroDestino: json["NumeroDestino"],
        tipoDesvio: json["TipoDesvio"].toString(),
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        "Extension": extension,
        "EstadoExtension": estadoExtension,
        "Nombre": Nombre,
        "NumeroTelefonico": NumeroTelefonico,
        "Estado": Estado,
        "NumeroDestino": numeroDestino,
        "TipoDesvio": tipoDesvio,
        "data": data,
      };
}
