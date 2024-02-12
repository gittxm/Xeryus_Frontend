import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xyrusflutter/src/models/Users.dart';
import 'package:xyrusflutter/src/models/Extensiones.dart';
import '../../provider/contratos_provider.dart';

class ClientProfileInfoController extends GetxController {
  var user = User.fromJson(GetStorage().read('user')).obs;
  //Extensionn ext = Extensionn.fromJson(GetStorage().read('ext') ?? {});
  var ext1 = Extensionn.fromJson(GetStorage().read<List>('estado')?.firstWhere(
              (element) => element['Activo'] == 1,
              orElse: () => null) ??
          {})
      .obs;
  UsersProvider usersProvider = UsersProvider();

  void extension() async {}

  exten() {
    //eliminar
    String estadoN = ext1.value.Estado.toString() ?? '';

    switch (ext1.value.Nombre) {
      case '1':
        print('Disponible');
        estadoN = "Disponible";
        break;
      case '2':
        print('El estado es 2  ');
        estadoN = "2";
        break;
      case '3':
        print('El estado es 3  ');
        estadoN = "Ausente";
        break;
      case '4':
        print('El estado es 4  ');
        estadoN = "Viaje";
        break;
      case '5':
        print('El estado es  5  ');
        estadoN = "Oficina";
        break;

      case '6':
        print('El estado es  6 ');
        estadoN = "Casa";
        break;
    }
    return estadoN;

    //print('usuario extension ${ext.toJson}');
    print('usuario extension ${ext1.value.Estado}');
  }

  void goToUpdate() {}

  void signOut() {
    GetStorage().remove('user');
    GetStorage().remove('ext');
    GetStorage().remove('ext3');
    GetStorage().remove('urls');
    GetStorage().remove('estado');
    GetStorage().remove('ext0');
    GetStorage().remove('Activo');

    Get.offNamedUntil('/', (route) => false);
  }
}
