import 'dart:convert';

Extension extensionFromJson(String str) => Extension.fromJson(json.decode(str));

String extensionToJson(Extension data) => json.encode(data.toJson());

class Extension {
  String? extension;
  String? estadoExtension;
  String? numeroDestino;
  String? tipoDesvio;
  dynamic data;
  Extension({
    this.extension,
    this.estadoExtension,
    this.numeroDestino,
    this.tipoDesvio,
    this.data,
  });

  factory Extension.fromJson(Map<String, dynamic> json) => Extension(
        extension: json["Extension"],
        estadoExtension: json["EstadoExtension"].toString(),
        numeroDestino: json["NumeroDestino"],
        tipoDesvio: json["TipoDesvio"].toString(),
        data: json["data"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "Extension": extension,
        "EstadoExtension": estadoExtension,
        "NumeroDestino": numeroDestino,
        "TipoDesvio": tipoDesvio,
        "data": data,
      };
}
