import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import '../../../models/Extensiones.dart';

class ExtensionUpdate extends GetxController {
  var ext = Extension.fromJson(GetStorage().read('ext') ?? {}).obs;

  void updatemove() async {
    goToupdate();
  }

  void goToupdate() {
    Get.offNamedUntil('/client/updates', (route) => false);
  }

  exten() {
    String nEstado = ext.value.estadoExtension.toString() ?? '';
    switch (ext.value.estadoExtension) {
      case '1':
        nEstado = 'Activo';
        break;
      case '2':
        nEstado = 'Ausente';
        break;
      case '3':
        nEstado = 'No Disponible';
        break;
      case '4':
        nEstado = 'Viaje';
        break;
      case '5':
        nEstado = 'Oficina';
        break;
      case '6':
        nEstado = 'Casa';
        break;
    }
    return nEstado;
  }

  Icon icono() {
    Icon icono;
    switch (ext.value.estadoExtension) {
      case "1":
        icono = Icon(
          Icons.circle,
          color: const Color(0xFF167F67),
        );

        // Icono para estado "Activo"
        break;
      case "2":
        icono = Icon(
          Icons.phone,
          color: Colors.orangeAccent,
        ); // Icono para estado "Ausente"
        break;
      case "3":
        icono = Icon(Icons.phone_disabled_sharp,
            color: Colors.redAccent); // Icono para estado "No Disponible"
        break;
      case "4":
        icono = Icon(
          Icons.airplanemode_active_outlined,
          color: Colors.yellow,
        ); // Icono para estado "Viaje"
        break;
      case "5":
        icono = Icon(
          Icons.computer_rounded,
          color: Colors.deepPurple,
        ); // Icono para estado "Oficina"
        break;
      case "6":
        icono = Icon(
          Icons.home,
          color: Colors.blueAccent,
        ); // Icono para estado "Casa"
        break;
      default:
        icono = Icon(Icons.error); // Icono para estado desconocido
        break;
    }
    return icono;
  }

  void goToInfo() {
    Get.offNamedUntil('/client/update', (route) => false);
    ext = Extension.fromJson(GetStorage().read('ext') ?? {}).obs;
  }
}
