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
  var ext5 = Extensionn.fromJson(GetStorage().read<List>('estado')?.firstWhere(
              (element) => element['Activo'] == 1,
              orElse: () => null) ??
          {})
      .obs;
  //var ext5 = Extensionn.fromJson({}).obs;

  TextEditingController estController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  
  late String estadoA1 = '${ext5.value.Nombre ?? ''}';
  //String estadoA1 = "Activo";
  String estadoN = "";
  UsersProvider usersProvider = UsersProvider();
  //ClientProfileInfoController con = Get.put(ClientProfileInfoController());
  ExtensionUpdate up = Get.put(ExtensionUpdate());
  ExtensionUpdate extensionUpdate = Get.find();
  updateController() {
    /* updateFromStorage();
    GetStorage().listenKey('estado', (value) {
      updateFromStorage();
    }); */
    numberController.text = ext5.value.NumeroTelefonico ?? '';
    estController.text = ext5.value.Estado ?? '';
  }
  /* void updateFromStorage() {
    var data = GetStorage().read<List>('estado')?.firstWhere(
              (element) => element['Activo'] == 1,
              orElse: () => null,
            ) ??
        {};
    // Asegúrate de que 'data' es un Map<String, dynamic> antes de pasarlo a fromJson
    if (data is! Map<String, dynamic>) {
      data = Map<String, dynamic>.from(data);
    }
    ext5.value = Extensionn.fromJson(data);
    numberController.text = ext5.value.NumeroTelefonico ?? '';
    estController.text = ext5.value.Estado ?? '';
  } */

  void updatep() async {
    print('Valor de estado ${estadoA1}');

    switch (estadoA1) {
      case 'BUZON':
        print('El estado es Buzon');
        estadoN = "0";
        break;
      case 'NO_DISPONIBLE':
        print('El estado es No Disponible ');
        estadoN = "1";
        break;
      case 'DISPONIBLE':
        print('El estado es Disponible');
        estadoN = "2";
        break;
      case 'AUSENTE':
        print('El estado es Ausente');
        estadoN = "3";
        break;
      case 'OFICINA':
        print('El estado es Oficina  ');
        estadoN = "4";
        break;

      case 'CASA':
        print('El estado es Casa');
        estadoN = "5";
        break;
      case 'VIAJE':
        print('El estado es Viaje');
        estadoN = "6";
        break;
    }

    User userT = User.fromJson(GetStorage().read('user'));

    String numero = '${userT.id ?? ''}';

    String estado = estadoN;
    String number = numberController.text;

    Extensionn ext3 = Extensionn.fromJson(GetStorage().read('ext'));

    String ext2 = '${ext3.extension ?? ''}';
    String estado1 = '${estadoN ?? ''}';
    String estado2 = '${estadoN ?? ''}';
    print('estado1 ${estado1}');
    print('estado2 ${estado2}');

    Extensionn myUser = Extensionn(
      Estado: ext5.value.Estado,
    );

    Contratos contratos = Contratos.fromJson(GetStorage().read("contratos"));
    String urls = contratos.url ?? '';

    //si el numero vacio no mandar conf
    ResponseApi responsedata1 =
        await UsersProvider().UPDATE('${ext2 ?? ''}', urls, estado1, estado2);
    if (responsedata1.success == true) {
      GetStorage().write('ext3', responsedata1.message);
//extensionUpdate.ext1.value = Extension.fromJson(responsedata1.data);

      print('response api UPDATE  ${responsedata1.message}');
      print('EXTUP  ${extensionUpdate.ext0.value}');
    }
    Extensionn ext9 = Extensionn.fromJson(GetStorage().read('ext'));
    String numeroh = '${ext9.extension ?? ''}';

    ResponseApi responseApiS = await usersProvider.selectAll(numeroh, urls);
    GetStorage().write('estado', responseApiS.data);

    print('Estado extencion ${estado}');
    print('numero ${number}');
  }
}
