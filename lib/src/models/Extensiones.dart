import 'dart:convert';

Extension extensionFromJson(String str) => Extension.fromJson(json.decode(str));

String extensionToJson(Extension data) => json.encode(data.toJson());

class Extension {
  String? extension;
  String? estadoExtension;
  String? numeroDestino;
  String? tipoDesvio;
  Extension({
    this.extension,
    this.estadoExtension,
    this.numeroDestino,
    this.tipoDesvio,
  });

  factory Extension.fromJson(Map<String, dynamic> json) => Extension(
        extension: json["Extension"],
        estadoExtension: json["EstadoExtension"].toString(),
        numeroDestino: json["NumeroDestino"],
        tipoDesvio: json["TipoDesvio"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "Extension": extension,
        "EstadoExtension": estadoExtension,
        "NumeroDestino": numeroDestino,
        "TipoDesvio": tipoDesvio,
      };
}
