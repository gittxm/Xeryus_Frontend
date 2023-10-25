import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xyrusflutter/src/models/Estados.dart';
import 'package:xyrusflutter/src/provider/contratos_provider.dart';

class Estados extends StatefulWidget {
  @override
  _SelectAllState createState() => _SelectAllState();
}

class _SelectAllState extends State<Estados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RespuestaApi'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            {
              Estado estadoT = Estado.fromJson(GetStorage().read('user'));
              String estado = '${estadoT.estado ?? ''}';
              Estado activoT = Estado.fromJson(GetStorage().read('user'));
              String Activo = '${activoT.Activo ?? ''}';
              Estado responseApi =
                  await UsersProvider().selectAll(estado, Activo);
              if (responseApi.estado == true) {
                GetStorage().write('rest', responseApi.estado);
                print(responseApi.estado);
                print(responseApi.Activo);
              } else {
                print('La respuesta del Api es null');
              }
            }
          },
          child: Text('Actualizado'),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Estados(),
    ));
