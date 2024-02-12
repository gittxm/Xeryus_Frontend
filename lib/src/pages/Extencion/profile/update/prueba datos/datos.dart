import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MiVista extends StatefulWidget {
  @override
  _MiVistaState createState() => _MiVistaState();
}

class _MiVistaState extends State<MiVista> {
  late String _datos;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  void _cargarDatos() async {
    String url = 'http://192.168.3.71:3000/api/users/restriccion';
    Map<String, String> parametros = {'Extension': '1'};
    http.Response respuesta = await http.post(Uri.parse(url), body: parametros);
    setState(() {
      _datos = respuesta.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Vista'),
      ),
      body: Center(
        child: _datos == null ? CircularProgressIndicator() : Text(_datos),
      ),
    );
  }
}
