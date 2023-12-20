import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
  String estadoA1 = "Activo";
  String estadoN = "";
  UsersProvider usersProvider = UsersProvider();
  ClientProfileInfoController con = Get.put(ClientProfileInfoController());
  ExtensionUpdate up = Get.put(ExtensionUpdate());
  ExtensionUpdate extensionUpdate = Get.find();
  updateController() {
    numberController.text = ext.numeroDestino ?? '';
    estController.text = ext.Estado ?? '';
  }

  void updatep() async {
    print('Valor de estado ${estadoA1}');

    switch (estadoA1) {
      case 'Buzon':
        print('El estado es Buzon');
        estadoN = "0";
        break;
      case 'No Disponible':
        print('El estado es No Disponible ');
        estadoN = "1";
        break;
      case 'Disponible':
        print('El estado es Disponible');
        estadoN = "2";
        break;
      case 'Ausente':
        print('El estado es Ausente');
        estadoN = "3";
        break;
      case 'Oficina':
        print('El estado es Oficina  ');
        estadoN = "4";
        break;

      case 'Casa':
        print('El estado es Casa');
        estadoN = "5";
        break;
      case 'Viaje':
        print('El estado es Viaje');
        estadoN = "6";
        break;
    }

    User userT = User.fromJson(GetStorage().read('user'));

    String numero = '${userT.id ?? ''}';

    String estado = estadoN;
    String number = numberController.text;

    Extension ext3 = Extension.fromJson(GetStorage().read('ext'));

    String ext2 = '${ext3.extension ?? ''}';

    Extension myUser = Extension(
      Estado: ext.Estado,
    );

    Contratos contratos = Contratos.fromJson(GetStorage().read("contratos"));
    String urls = contratos.url ?? '';

    //si el numero vacio no mandar conf
    ResponseApi responsedata1 =
        await UsersProvider().UPDATE('${ext2 ?? ''}', urls, estado);
    if (responsedata1.success == true) {
      GetStorage().write('ext3', responsedata1.message);
      //extensionUpdate.ext1.value = Extension.fromJson(responsedata1.data);

      print('response api UPDATE  ${responsedata1.message}');
      print('EXTUP  ${extensionUpdate.ext0.value}');
      print('extencion' '${con.ext1.extension}');
      print('Estado' '${con.ext1.estadoExtension}');
    }
    Extension ext9 = Extension.fromJson(GetStorage().read('ext'));
    String numeroh = '${ext9.extension ?? ''}';

    ResponseApi responseApiS = await usersProvider.selectAll(numeroh, urls);
    GetStorage().write('estado2', responseApiS.data);
    print('Estado extencion ${estado}');
    print('numero ${number}');
  }
}
