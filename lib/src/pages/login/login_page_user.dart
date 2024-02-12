import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xyrusflutter/src/pages/login/login_controller.dart';

class LoginPageUser extends StatelessWidget {
  LoginController con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*bottomNavigationBar: Container(
          height: 50,
          child: _textDontHaveAccount(),
        ),*/
        body: Stack(children: [
      _backgroundCover(context),
      _boxForm(context),
      Column(children: [
        _imageCover(),
        _textAppName(),
      ])
    ]));
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.amber,
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.35, left: 50, right: 50),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
      ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // _textYourInfo(),

            _textFieldUser(),
            _textFieldPassword(),
            _buttonLogin()
          ],
        ),
      ),
    );
  }

//cambiar nombre

  Widget _textFieldUser() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.userController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'UserName',
            prefixIcon: Icon(Icons.supervised_user_circle_outlined)),
      ),
    );
  }

  Widget _textFieldNoContrato() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: TextField(
        controller: con.numeroController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'NoContrato', prefixIcon: Icon(Icons.verified_user)),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña', prefixIcon: Icon(Icons.lock)),
      ),
    );
  }
/*
  Widget _textDontHaveAccount() {
    return Row(
      // UBICAR ELEMENTOS UNO AL LADO DEL OTRO (HORIZONTAL)
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        SizedBox(width: 7),
        GestureDetector(
          child: Text(
            'Registrate Aqui',
            style: TextStyle(
                color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ],
    );
  }*/

  Widget _textAppName() {
    return Text(
      'Xeryus App',
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w600, color: Colors.blueGrey),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          //onPressed: null,
          onPressed: () => con.login2(),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'LOGIN',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

//privadas
  Widget _imageCover() {
    return SafeArea(
        child: Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            alignment: Alignment.center,
            child: Image.asset('assets/img/4_icono80-1.png',
                width: 130, height: 130)));
  }
}
