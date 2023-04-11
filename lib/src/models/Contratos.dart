// To parse this JSON data, do
//
//     final contratos = contratosFromJson(jsonString);

import 'dart:convert';

Contratos contratosFromJson(String str) => Contratos.fromJson(json.decode(str));

String contratosToJson(Contratos data) => json.encode(data.toJson());

class Contratos {
  String? id;
  String? numero;
  String? producto;
  String? cliente;
  String? horario;
  String? fechaExpiracion;
  String? telefonoSoporte;
  String? contacto;
  String? area;
  String? fechaRegistro;
  String? fechaModificacion;
  String? url;

  Contratos({
    this.id,
    this.numero,
    this.producto,
    this.cliente,
    this.horario,
    this.fechaExpiracion,
    this.telefonoSoporte,
    this.contacto,
    this.area,
    this.fechaRegistro,
    this.fechaModificacion,
    this.url,
  });

  factory Contratos.fromJson(Map<String, dynamic> json) => Contratos(
        id: json["Id"],
        numero: json["Numero"],
        producto: json["Producto"],
        cliente: json["Cliente"],
        horario: json["Horario"],
        fechaExpiracion: json["FechaExpiracion"],
        telefonoSoporte: json["TelefonoSoporte"],
        contacto: json["Contacto"],
        area: json["Area"],
        fechaRegistro: json["FechaRegistro"],
        fechaModificacion: json["FechaModificacion"],
        url: json["Url"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Numero": numero,
        "Producto": producto,
        "Cliente": cliente,
        "Horario": horario,
        "FechaExpiracion": fechaExpiracion,
        "TelefonoSoporte": telefonoSoporte,
        "Contacto": contacto,
        "Area": area,
        "FechaRegistro": fechaRegistro,
        "FechaModificacion": fechaModificacion,
        "Url": url,
      };
}
