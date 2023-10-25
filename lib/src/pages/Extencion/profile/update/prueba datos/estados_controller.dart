import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xyrusflutter/src/models/Estados.dart';
import 'package:xyrusflutter/src/models/response_api.dart';
import 'package:xyrusflutter/src/provider/contratos_provider.dart';

class Estados extends GetxController {
  //Estado id = Estado.fromJson(GetStorage().read('Estado'));
  UsersProvider usersProvider = UsersProvider();
}
