import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xyrusflutter/src/models/Users.dart';

class HomeController extends GetxController {
  //crear clase para manejar los usuarios de la bdd
  User user = User.fromJson(GetStorage().read('user') ?? {});

  HomeController() {
    print('Usuario de secion:${user.toJson()}');
  }

  void signOut() {
    GetStorage().remove('user');

    Get.offNamedUntil('/', (route) => false);
  }
}
