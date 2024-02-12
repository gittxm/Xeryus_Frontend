import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xyrusflutter/src/pages/Extencion/profile/info_page_controller.dart';

import '../extension_controller.dart';

ExtensionUpdate up = Get.put(ExtensionUpdate());
ClientProfileInfoController sig = Get.put(ClientProfileInfoController());

class pageUpdate extends StatefulWidget {
  const pageUpdate({super.key});

  @override
  State<pageUpdate> createState() => _pageUpdateState();
}

class _pageUpdateState extends State<pageUpdate> {
  ExtensionUpdate con = Get.put(ExtensionUpdate());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Xeryus App'),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Menú',
                ),
              ),
              ListTile(
                title: Text('Cerrar Sesion',
                    style: TextStyle(color: Colors.white)),
                tileColor: Colors.red,
                onTap: () {
                  sig.signOut();
                  // Acciones al hacer tap en la opción 1
                },
              ),
            ],
          ),
        ),
        body: Obx(
          () => Stack(
            // POSICIONAR ELEMENTOS UNO ENCIMA DEL OTRO
            children: [
              _backgroundCover(context),
              _boxForm(context),
            ],
          ),
        ));
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.10,
      color: Colors.amber,
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.15, left: 50, right: 50),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
      ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourExtension(),
            _textYourEstadoExtension(),
            _textYourNumeroDestino(),
            _buttonUpdate(),
          ],
        ),
      ),
    );
  }

  Widget _buttonUpdate() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: () => up.goToupdate(),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'Updates',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _logOut() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
      child: ElevatedButton(
        onPressed: () => sig.signOut(),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 8),
            backgroundColor: Colors.red[300]),
        child: Text(
          'Cerrar Sesion',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _textYourEstadoExtension() {
    Icon icono = con.icono();
    return Container(
        margin: EdgeInsets.only(top: 1),
        child: ListTile(
          leading: icono,
          title: Text('Estado Extencion'),
          subtitle: Text('${con.exten()}'),
        ));
  }

  Widget _textYourExtension() {
    return Container(
        margin: EdgeInsets.only(top: 1),
        child: ListTile(
          leading: Icon(Icons.supervised_user_circle),
          title: Text(' Extencion'),
          subtitle: Text('${con.ext0.value.extension ?? ''}'),
        ));
  }

  Widget _textYourNumeroDestino() {
    return Container(
        margin: EdgeInsets.only(top: 1),
        child: ListTile(
          leading: Icon(Icons.phone),
          title: Text('Numero Extencion'),
          subtitle: Text(con.ext0.value.extension.toString()),
        ));
  }

  Widget _textYourtipoDesvio() {
    return Container(
        margin: EdgeInsets.only(top: 1),
        child: ListTile(
          leading: Icon(Icons.phonelink_lock),
          title: Text('Tipo Desvio'),
          subtitle: Text('${con.ext0.value.tipoDesvio ?? ''}'),
        ));
  }

  // ignore: unnecessary_string_interpolations

}
