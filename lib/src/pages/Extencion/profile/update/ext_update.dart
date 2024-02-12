import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xyrusflutter/src/pages/Extencion/profile/info_page_controller.dart';
import 'package:xyrusflutter/src/pages/Extencion/profile/update/ext_update_controller.dart';

updateController con = Get.put(updateController());
ExtensionUpdate up = Get.put(ExtensionUpdate());

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class _UpdatePageState extends State<UpdatePage> {
  //String valueName = con.estadoA1 ?? '';
  static const menuItemsShow = <Item>[
    const Item(
        'BUZON', Icon(Icons.call_end_outlined, color: Colors.deepOrangeAccent)),
    const Item('NO_DISPONIBLE',
        Icon(Icons.phone_disabled_sharp, color: Colors.redAccent)),
    const Item(
        'DISPONIBLE',
        Icon(
          Icons.circle,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'AUSENTE',
        Icon(
          Icons.phone,
          color: Colors.orangeAccent,
        )),
    const Item(
        'OFICINA',
        Icon(
          Icons.computer_rounded,
          color: Colors.deepPurple,
        )),
    const Item(
        'CASA',
        Icon(
          Icons.home,
          color: Colors.blueAccent,
        )),
    const Item(
        'VIAJE',
        Icon(
          Icons.airplanemode_active_outlined,
          color: Colors.yellow,
        )),
  ];

  final List<DropdownMenuItem<Item>> _dropDownMenuItems = menuItemsShow
      .map(
        (Item value) => DropdownMenuItem<Item>(
            value: value,
            child: Row(
              children: [
                value.icon,
                SizedBox(
                  width: 10,
                ),
                Text(value.name)
              ],
            )),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
// POSICIONAR ELEMENTOS UNO ENCIMA DEL OTRO
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _buttonBack(),
        ],
      ),
    );
  }

  Widget _buttonBack() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.only(left: 20),
      child: IconButton(
        onPressed: () => up.goToInfo(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 30,
        ),
      ),
    ));
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      color: Colors.amber,
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.3, left: 50, right: 50),
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
      ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textFieldNumero(),
//_textFieldEstado(),
            scroll(context),
            _buttonUpdate(),
          ],
        ),
      ),
    );
  }

  Widget _textFieldNumero() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: TextField(
        controller: con.numberController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Numero Extencion',
            prefixIcon: Icon(Icons.data_usage_rounded)),
      ),
    );
  }

  Widget _textFieldEstado() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.estController,
        keyboardType: TextInputType.text,
        decoration:
            InputDecoration(hintText: 'Estado', prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  Widget _buttonUpdate() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: () => con.updatep(),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text(
            'UPDATE',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  String _btn1SelectedVal = con.estadoA1;

  Widget scroll(BuildContext context) {
    return Container(
      child: ListTile(
        title: const Text('Estado Extension'),
        trailing: DropdownButton<Item>(
// Must be one of items.value.
            /// agregar el icono actual con getx .value
// value: ,
            onChanged: (Item? newValue) {
              if (newValue != null) {
                setState(
                  () => con.estadoA1 = newValue.name,
                );
                print(con.estadoA1);
              }
            },
            items: _dropDownMenuItems,
            value: menuItemsShow.firstWhere(
              (item) => item.name == con.estadoA1,
              orElse: () => menuItemsShow[0],
            )),
      ),
    );
  }
}
