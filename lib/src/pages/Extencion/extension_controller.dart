import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xyrusflutter/src/models/Users.dart';
import 'package:xyrusflutter/src/models/Extensiones.dart';
import '../../provider/contratos_provider.dart';

class ClientProfileInfoController extends GetxController {
  var user = User.fromJson(GetStorage().read('user')).obs;
  Extension ext1 = Extension.fromJson(GetStorage().read('ext') ?? {});
  UsersProvider usersProvider = UsersProvider();

  exten() {
    String estadoN = ext1.estadoExtension.toString() ?? '';
    print("estadoN" + estadoN);

    switch (ext1.estadoExtension) {
      case '0':
        print('El estado es Buzon');
        estadoN = "0";
        break;
      case '1':
        print('El estado es No Disponible ');
        estadoN = "1";
        break;
      case '2':
        print('El estado es Disponible');
        estadoN = "2";
        break;
      case '3':
        print('El estado es Ausente');
        estadoN = "3";
        break;
      case '4':
        print('El estado es Oficina');
        estadoN = "4";
        break;
      case '5':
        print('El estado es Casa');
        estadoN = "5";
        break;
      case '6':
        print('El estado es Viaje');
        estadoN = "6";
        break;
    }
    return estadoN;

    //print('usuario extension ${ext.toJson}');
    print('usuario extension ${ext1.extension}');
  }

  void signOut() {
    GetStorage().remove('user');
    GetStorage().remove('ext');
    GetStorage().remove('urls');

    Get.offNamedUntil('/', (route) => false);
  }
}
