import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:xyrusflutter/src/enviroment/enviroment.dart';
import 'package:xyrusflutter/src/models/Contratos.dart';
import 'package:xyrusflutter/src/models/Estados.dart';
import 'package:xyrusflutter/src/models/Extensiones.dart';

import '../models/response_api.dart';

class UsersProvider extends GetConnect {
  String url = Environment.API_URL;
  String url2 = Environment.API_URL2;
  String url3 = Environment.API_URL3;

  Future<ResponseApi> login(
      String urls, String usuario, String password) async {
    Response response = await post('$url2', {
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
    Response response = await post('$url', {
      'num': numero,
      'url': url
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

  Future<ResponseApi> extension(String id, String urls) async {
    Response response = await post('$url3/api/users/extensionD', {
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

  Future<Estado> selectAll(String estado, String Activo) async {
    Response response = await get('$url3/api/users/selectall', headers: {
      'Content-Type': 'application/json'
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA
    if (response.statusCode == 200) {
      Get.snackbar('200', 'Actualizada');
      return Estado.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      //restApi
      Estado responseApi = Estado.fromJson(response.body);
      Get.snackbar('Error', 'No encontrada');
      print(response.body);
      return responseApi;
    }
  }

  //////
  Future<ResponseApi> update(String urls, String estado, String id) async {
    Response response = await post('$url3/api/users/estados_mod', {
      "ext": "1011",
      "estado": 4,
      'urls': urls
    }, headers: {
      'Content-Type': 'application/json'
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo Actualisar  Estado ');
      return ResponseApi();
    }
    //restApi

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

//
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

//

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
