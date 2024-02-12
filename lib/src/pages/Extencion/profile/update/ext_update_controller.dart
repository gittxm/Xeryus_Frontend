import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  //Extensionn ext = Extensionn.fromJson(GetStorage().read('ext') ?? {});
  var ext5 = Extensionn.fromJson(GetStorage().read<List>('estado')?.firstWhere(
              (element) => element['Activo'] == 1,
              orElse: () => null) ??
          {})
      .obs;
  TextEditingController estController = TextEditingController();
  TextEditingController numberController = TextEditingController();
//*
  //late String estadoA1 = '${ext5.value.Nombre ?? ''}';
  //late String estadoN = '${ext5.value.Estado ?? ''}';
  String estadoA1 = "";
  String estadoN = "";
  UsersProvider usersProvider = UsersProvider();
  ClientProfileInfoController con = Get.put(ClientProfileInfoController());
  ExtensionUpdate up = Get.put(ExtensionUpdate());
  ExtensionUpdate extensionUpdate = Get.find();
//poner un proces dialog CON UN IF QUE VALIDA LA INFO
  updateController() {
    numberController.text = ext5.value.NumeroTelefonico ?? '';
    estController.text = ext5.value.Estado ?? '';
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
        print('El estado es Oficina ');
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
    print("prueba1" + ext5.value.NumeroTelefonico.toString());
    print("prueba2" + ext5.value.Estado.toString());

    User userT = User.fromJson(GetStorage().read('user'));

    String numero = '${userT.id ?? ''}';

    String estado = estadoN;
    String number = numberController.text;

    Extensionn ext3 = Extensionn.fromJson(GetStorage().read('ext'));

    String ext2 = '${ext3.extension ?? ''}';

    Extensionn myUser = Extensionn(
      Estado: ext5.value.Estado,
    );

    Contratos contratos = Contratos.fromJson(GetStorage().read("contratos"));
    String urls = contratos.url ?? '';
/*
ResponseApi responseApi =
await usersProvider.update(urls,'${estado ?? ''}', '${numero ?? ''}');
*/

    ResponseApi responseApi3 =
        await usersProvider.restriccion(urls, '${con.ext1.value.extension}');
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
    ResponseApi responsedata1 =
        await UsersProvider().UPDATE('${ext2 ?? ''}', urls, estado);
    if (responsedata1.success == true) {
      GetStorage().write('ext3', responsedata1.message);
//extensionUpdate.ext1.value = Extension.fromJson(responsedata1.data);

      print('response api UPDATE ${responsedata1.message}');
      print('EXTUP ${extensionUpdate.ext0.value}');
      print('Estado de pagina 1 ${extensionUpdate.ext0.value.Estado}');
      print('extencion' '${con.ext1.value.extension}');
      print('Estado' '${con.ext1.value.Estado}');
    }
    Extensionn ext9 = Extensionn.fromJson(GetStorage().read('ext'));
    String numeroh = '${ext9.extension ?? ''}';

    ResponseApi responseApiS = await usersProvider.selectAll(numeroh, urls);
    GetStorage().write('estado5', responseApiS.data);
    print('Estado extencion ${estado}');
    print('numero ${number}');
  }
}
