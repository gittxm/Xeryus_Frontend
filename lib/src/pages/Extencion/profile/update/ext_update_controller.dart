import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xyrusflutter/src/models/Restriccion.dart';
import 'package:xyrusflutter/src/models/Users.dart';
import 'package:xyrusflutter/src/models/response_api.dart';
import 'package:xyrusflutter/src/pages/Extencion/profile/info_page_controller.dart';
import 'package:xyrusflutter/src/provider/contratos_provider.dart';

import '../../../../models/Contratos.dart';
import '../../../../models/Extensiones.dart';
import '../../extension_controller.dart';

class updateController extends GetxController {
  Extension ext = Extension.fromJson(GetStorage().read('ext') ?? {});
  TextEditingController estController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  //*
  String estado1 = "Activo";
  String estadoN = "";
  UsersProvider usersProvider = UsersProvider();
  ClientProfileInfoController con = Get.put(ClientProfileInfoController());
  ExtensionUpdate up = Get.put(ExtensionUpdate());
  ExtensionUpdate extensionUpdate = Get.find();
  //poner un proces dialog CON UN IF QUE VALIDA LA INFO
  updateController() {
    numberController.text = ext.numeroDestino ?? '';
    estController.text = ext.estadoExtension ?? '';
  }

  void updateI() async {
    print('valor de estado ${estado1}');
    switch (estado1) {
      case 'Disponible':
        print('El estado es uno 1  ');
        estadoN = "1";
        break;
      case 'No Disponible':
        print('El estado es 2  ');
        estadoN = "2";
        break;
      case 'Ausente':
        print('El estado es 3  ');
        estadoN = "3";
        break;
      case 'Viaje':
        print('El estado es 4  ');
        estadoN = "4";
        break;
      case 'Oficina':
        print('El estado es  5  ');
        estadoN = "5";
        break;

      case 'Casa':
        print('El estado es  6 ');
        estadoN = "6";
        break;
    }

    User userT = User.fromJson(GetStorage().read('user'));

    String numero = '${userT.id ?? ''}';

    String estado = estadoN;
    String number = numberController.text;

    Extension myUser = Extension(
      estadoExtension: ext.estadoExtension,
    );

    Contratos contratos = Contratos.fromJson(GetStorage().read("contratos"));
    String urls = contratos.url ?? '';

/*
    ResponseApi responseApi =
        await usersProvider.update(urls,'${estado ?? ''}', '${numero ?? ''}');
*/

    ResponseApi responseApi3 =
        await usersProvider.restriccion(urls, '${con.ext.extension}');
    GetStorage().write('rest', responseApi3.data);
    print(responseApi3.data);
    Restriccion rest = Restriccion.fromJson(GetStorage().read('rest'));

    String prefijo = '${rest.prefijo ?? ''}';
    print('prefijo ss ${prefijo}');

    RegExp patron = RegExp(r'^9\d{9}$');

    if (number.startsWith(prefijo)) {
      ResponseApi responseApi2 = await usersProvider.updateN(
          urls, '${number ?? ''}', '${numero ?? ''}');
      print(responseApi2.message);
      Get.snackbar('Si Se Puede', number);
    } else {
      print("El Número De Teléfono Es Inválido.");
      Get.snackbar('Numero Incorrecto Agregar al inicio $prefijo', number);
    }
    //si el numero vacio no mandar conf
    ResponseApi responseApi =
        await usersProvider.update(urls, estado, '${numero ?? ''}');

    if (responseApi.success == true) {
      //Get.snackbar('PROCESO TERMINADO', responseApi.message ?? '');
      GetStorage().write('ext', responseApi.data);
      extensionUpdate.ext.value = Extension.fromJson(responseApi.data);

      print('response api UPDATE  ${responseApi.data}');
      print('EXTUP  ${extensionUpdate.ext.value}');
      print('extencion' '${con.ext.extension}');
    }
    print('Estado extencion ${estado}');
    print('numero ${number}');
  }
}
