import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xyrusflutter/src/pages/Extencion/extension_controller.dart';
import 'package:xyrusflutter/src/pages/Extencion/profile/info_page_controller.dart';

import 'profile/update/ext_update_controller.dart';

ClientProfileInfoController con = Get.put(ClientProfileInfoController());
ExtensionUpdate up = Get.put(ExtensionUpdate());
updateController contExt = Get.put(updateController());

class ClientExtensionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // POSICIONAR ELEMENTOS UNO ENCIMA DEL OTRO
        children: [_backgroundCover(context), _card(), _boxForm(context)],
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.04,
      color: Colors.amber,
    );
  }

  Widget _card() {
    return Center(
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            up.updatemove();

            debugPrint('Card tapped.');
          },
          child: SizedBox(
              width: 355,
              height: 260,
              child: Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 60),
                  child: Column(
                    children: [
                      _textYourExtension(),
                      _textYourEstadoExtension(),
                      _textYourNumeroDestino(),
                    ],
                  ))),
        ),
      ),
    );
  }

  Widget _textYourEstadoExtension() {
    return Container(
        // margin: EdgeInsets.only(top: .01),
        child: ListTile(
      leading: Icon(Icons.phonelink_lock),
      title: Text('Estado Extencion'),
      subtitle: Text('${con.exten()}'),
    ));
  }

////////
  Widget _textYourExtension() {
    return Container(
        // margin: EdgeInsets.only(top: .01),
        child: ListTile(
      leading: Icon(Icons.phonelink_lock),
      title: Text('${con.ext.extension ?? ''}'),
      subtitle: Text('Extencion'),
    ));
  }

  Widget _textYourNumeroDestino() {
    return Container(
        // margin: EdgeInsets.only(top: .01),
        child: ListTile(
      leading: Icon(Icons.phonelink_lock),
      title: Text(con.ext.numeroDestino.toString()),
      subtitle: Text('Numero Extencion'),
    ));
  }

  Widget _textYourtipoDesvio() {
    return Container(
        //  margin: EdgeInsets.only(top: .01),
        child: ListTile(
      leading: Icon(Icons.phonelink_lock),
      title: Text('${con.ext.tipoDesvio ?? ''}'),
      subtitle: Text('Tipo Desvio'),
    ));
  }

  Widget _boxForm(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.15,
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.3, left: 50, right: 50),
        decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.55))
        ]),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => up.updatemove(),
                child: Text('Update'),
              ),
              ElevatedButton(
                onPressed: () => con.signOut(),
                child: Text('Cerrar sesion'),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buttonUpdate() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: () => con.extension(),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'REGISTRARSE',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _buttonUpdateS() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: () => con.exten(),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'REGISTRARSE',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 30),
      child: Text(
        '${con.user.value.id ?? ''}  ${con.ext.extension} ',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}

// '${con.user.id ?? ''}  ${con.ext.extension} ,${con.ext.estadoExtension},${con.ext.numeroDestino},${con.ext.tipoDesvio}',