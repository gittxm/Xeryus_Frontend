import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import '../../../models/Extensiones.dart';

class ExtensionUpdate extends GetxController {
  var ext0 = Extensionn.fromJson(GetStorage().read<List>('estado')?.firstWhere(
              (element) => element['Activo'] == 1,
              orElse: () => null) ??
          {})
      .obs;

  void goToupdate() {
    Get.offNamedUntil('/client/updates', (route) => false);
  }

  String exten() {
    String nEstado = ext0.value.Nombre ?? '';

    switch (ext0.value.Estado) {
      case '0':
        nEstado = 'BUZON';
        break;
      case '1':
        nEstado = 'NO_DISPONIBLE';
        break;
      case '2':
        nEstado = 'DISPONIBLE';
        break;
      case '3':
        nEstado = 'AUSENTE';
        break;
      case '4':
        nEstado = 'OFICINA';
        break;
      case '5':
        nEstado = 'CASA';
        break;
      case '6':
        nEstado = 'VIAJE';
        break;
    }
    return nEstado;
  }

  Icon icono() {
    Icon icono;
    switch (ext0.value.Estado) {
      case "0":
        icono = Icon(
          Icons.call_end_outlined,
          color: Colors.deepOrangeAccent,
        ); // Icono para estado "Buzon"
        break;
      case "1":
        icono = Icon(Icons.phone_disabled_sharp,
            color: Colors.redAccent); // Icono para estado "No Disponible"
        break;
      case "2":
        icono = Icon(
          Icons.circle,
          color: const Color(0xFF167F67),
        ); // Icono para estado "Disponible"
        break;
      case "3":
        icono = Icon(
          Icons.phone,
          color: Colors.orangeAccent,
        ); // Icono para estado "Ausente"
        break;
      case "4":
        icono = Icon(
          Icons.computer_rounded,
          color: Colors.deepPurple,
        ); // Icono para estado "Oficina"
        break;
      case "5":
        icono = Icon(
          Icons.home,
          color: Colors.blueAccent,
        ); // Icono para estado "Casa"
        break;
      case "6":
        icono = Icon(
          Icons.airplanemode_active_outlined,
          color: Colors.yellow,
        ); // Icono para estado "Viaje"
        break;
      default:
        icono = Icon(Icons.error); // Icono para estado desconocido
        break;
    }
    return icono;
  }

  void goToInfo() {
    Get.offNamedUntil('/client/update', (route) => false);
    ext0 = Extensionn.fromJson(GetStorage().read<List>('estado')?.firstWhere(
                (element) => element['Activo'] == 1,
                orElse: () => null) ??
            {})
        .obs;
  }

  void signOut() {
    GetStorage()
        .erase(); /* 
    GetStorage().remove('user');
    GetStorage().remove('ext');
    GetStorage().remove('ext3');
    GetStorage().remove('urls');
    GetStorage().remove('estado');
    GetStorage().remove('contratos');
    GetStorage().remove('rest'); */

    Get.offNamedUntil('/', (route) => false);
  }
}
