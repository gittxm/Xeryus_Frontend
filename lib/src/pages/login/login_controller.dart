import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:xyrusflutter/src/models/Contratos.dart';
import 'package:xyrusflutter/src/models/Extensiones.dart';

import '../../models/Users.dart';
import '../../models/response_api.dart';
import '../../provider/contratos_provider.dart';

class LoginController extends GetxController {
  TextEditingController numeroController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();
//---

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void login() async {
    String numero = numeroController.text.trim();
    // String user = userController.text.trim();
    //String password = passwordController.text.trim();

    if (isValidFormU(numero)) {
      ResponseApi responseApi = await usersProvider.loginC(numero);

      if (responseApi.success == true) {
        ResponseApi responseApi = await usersProvider.loginC(numero);

        GetStorage().write('contratos', responseApi.data);
        Contratos contratos =
            Contratos.fromJson(GetStorage().read("contratos"));
        String urls = contratos.url ?? '';
        ResponseApi responseApiUrls = await usersProvider.urls(urls);
        GetStorage().write('urls', responseApiUrls);
        print('respuesta urls$responseApiUrls');
        //  ResponseApi responseApi = await usersProvider.login(user, password);
        Get.snackbar('Numero Correcto',
            responseApi.message ?? ''); // DATOS DEL USUARIO EN SESION
        ///////
        ///

        //     methodB() async {
        //print('B start');
        //await methodC('B');
        // print('B end');
//}

        //nesecitamos pagina gotohome
        // goToHomePage();
        // await login2();
        goToLoginPage();
      } else {
        Get.snackbar(
            'Login fallido Numero de contrato', responseApi.message ?? '');
      }
    }
  }

// Validar la conexion a la segunda bases de datos .
//////////
////*
  ///

  login2() async {
    String user = userController.text.trim();
    String password = passwordController.text.trim();
    if (isValidForm(user, password)) {
      //
      Contratos contratos = Contratos.fromJson(GetStorage().read("contratos"));
      String urls = contratos.url ?? '';
      ResponseApi responseApiU =
          await usersProvider.login(urls, user, password);

      //  ResponseApi responseApiR = await usersProvider.restriccion("1011");
      print(responseApiU.success);
      if (responseApiU.success == true) {
        GetStorage().write('user', responseApiU.data);

        User userTS = User.fromJson(GetStorage().read('user'));
        String id = '${userTS.id ?? ''}';
        print('id  ${id}');
        ResponseApi responseApiF = await usersProvider.extension1(id, urls);
        GetStorage().write('user', responseApiF.data);

        Extensionn exten = Extensionn.fromJson(GetStorage().read('user'));
        String extension = '${exten.Numero ?? ''}';
        //String extensionr = '${exten.Usuario ?? ''}';
        print('exte  ${extension}');

        ResponseApi responseApiE =
            await usersProvider.extension(extension, urls);
        GetStorage().write('ext', responseApiE.data);
        print('ESTE ES estado  ${responseApiE.data}');

        Extensionn ext = Extensionn.fromJson(GetStorage().read('ext'));
        String numeroh = '${ext.Extension ?? ''}';
        print('Numero 97   ${numeroh}');

        ResponseApi responseApiS = await usersProvider.selectAll(numeroh, urls);
        GetStorage().write('estado', responseApiS.data);

        Get.snackbar('Login correcto',
            responseApiU.message ?? ''); // DATOS DEL USUARIO EN SESION
        goToHomePage();
      } else {
        Get.snackbar('Login fallido u', responseApiU.message ?? '');
      }
      //
    }
  }

  void goToHomePage() {
    Get.offNamedUntil('/client/extension', (route) => false);
  }

  void goToLoginPage() {
    Get.offNamedUntil('/login2', (route) => false);
  }

  bool isValidForm(String user, String password) {
    if (user.isEmpty || password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresa el numero');
      return false;
    }

    return true;
  }

  bool isValidFormU(String numero) {
    if (numero.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresa el numero');
      return false;
    }

    return true;
  }
}
