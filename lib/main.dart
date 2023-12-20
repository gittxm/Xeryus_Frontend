import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xyrusflutter/src/models/Users.dart';
import 'package:xyrusflutter/src/pages/Home/home.dart';
import 'package:xyrusflutter/src/pages/login/login_page.dart';
import 'package:xyrusflutter/src/pages/Extencion/profile/info_page.dart';

import 'src/pages/Extencion/profile/update/ext_update.dart';
import 'src/pages/Extencion/profile/update/prueba datos/datos.dart';
import 'src/pages/login/login_page_user.dart';

User userSession = User.fromJson(GetStorage().read('user') ?? {});
void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  } //se ejecuta el primer codigo

//quitar el user session para poder testear
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Xyrus app',
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id != null ? '/client/extension' : '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/login2', page: () => LoginPageUser()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(
            name: '/client/extension',
            page: () => pageUpdate()), //ClientExtensionPage()
        GetPage(name: '/client/update', page: () => pageUpdate()),
        GetPage(name: '/client/updates', page: () => UpdatePage()),
        GetPage(name: '/client/prueba', page: () => MiVista()),
      ],
      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: ColorScheme(
              primary: Colors.amber,
              secondary: Colors.amberAccent,
              brightness: Brightness.light,
              onBackground: Colors.grey,
              onPrimary: Colors.grey,
              surface: Colors.grey,
              onSurface: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey,
              onSecondary: Colors.grey,
              background: Colors.grey)),
      navigatorKey: Get.key,
    );
  }
}
