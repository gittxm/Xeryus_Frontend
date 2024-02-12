import 'dart:convert';
import 'package:get/get.dart';
import 'package:xyrusflutter/src/enviroment/enviroment.dart';

import '../models/response_api.dart';

class UsersProvider extends GetConnect {
  //String url = Environment.API_URL;
  //String url2 = Environment.API_URL2;
  String url3 = Environment.API_URL3;

  Future<ResponseApi> login(
      String urls, String usuario, String password) async {
    Response response = await post('$url3/api/users/login', {
      'urls': urls,
      'usuario': usuario,
      'password': password,
    }, headers: {
      'Content-Type': 'application/json'
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      return ResponseApi();
    }
    //restApi

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

  Future<ResponseApi> loginC(String numero) async {
    Response response = await post('$url3/api/users/contratos', {
      'num': numero,
      'url': url3
      //'password': password
    }, headers: {
      'Content-Type': 'application/json'
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      return ResponseApi();
    }
    //restApi

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    print(responseApi);
    return responseApi;
  }

  Future<ResponseApi> urls(String url) async {
    Response response = await post('$url3/api/users/urls', {
      'url': url,
    }, headers: {
      'Content-Type': 'application/json'
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Get.snackbar('Error', 'Servidor no');
      return ResponseApi();
    }
    //restApi

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

  Future<ResponseApi> extension(String extension, String urls) async {
    Response response = await post('$url3/api/users/extensionD', {
      'Extension': extension,
      'urls': urls
    }, headers: {
      'Content-Type': 'application/json'
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      return ResponseApi();
    }
    //restApi

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

  Future<ResponseApi> extension1(String id, String urls) async {
    Response response = await post('$url3/api/users/extension', {
      'id': id,
      'urls': urls
    }, headers: {
      'Content-Type': 'application/json'
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      return ResponseApi();
    }
    //restApi

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

  Future<ResponseApi> selectAll(String id, String urls) async {
    Response response = await post('$url3/api/users/selectall', {
      'id': id,
      'urls': urls,
    }, headers: {
      'Content-Type': 'application/json'
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.statusCode != 200) {
      print('la conexion Api fue exitosa: ${response.body}');
      return ResponseApi.fromJson(response.body);
    } else {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      ResponseApi responsedata = ResponseApi.fromJson(responseBody);
      print('La conexion Api es fallida: ${responsedata.data}');
      throw Exception('Error en la solicitud Api: ${responsedata.data}');
    }
  }

  Future<ResponseApi> UPDATE(String id, String urls, String estadoB) async {
    print("id" + id);
    print("estado" + estadoB);
    Response response = await put('$url3/api/users/updateestados', {
      'extension': id,
      'estado': estadoB,
      'urls': urls,
    }, headers: {
      'Content-Type': 'application/json'
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo Actualisar  Estado ');
      print('error');
      return ResponseApi();
    }

    ResponseApi responsedata = ResponseApi.fromJson(response.body);
    return responsedata;
  }

  Future<ResponseApi> updateN(String urls, String Numero, String id) async {
    Response response = await put('$url3/api/users/updateN', {
      'NumeroDestino': Numero,
      'id': id,
      'urls': urls
    }, headers: {
      'Content-Type': 'application/json'
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo Actualisar el numero de telefono');
      print(response.body);
      return ResponseApi();
    }
    //restApi

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    Get.snackbar('Se actualiso correctamente', 'Actualizado correctamente');
    return responseApi;
  }

  Future<ResponseApi> restriccion(String urls, String id) async {
    Response response = await post('$url3/api/users/restriccion', {
      'Extension': id,
      'urls': urls
    }, headers: {
      'Content-Type': 'application/json'
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Get.snackbar('Error', 'ingresa un 9 ');
      print(response.body);
      return ResponseApi();
    }
    //restApi

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    Get.snackbar('funciona restriccion', 'funciona restriccion');
    return responseApi;
  }
}
