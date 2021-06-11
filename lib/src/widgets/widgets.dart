import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/utils/colors_utils.dart';

BoxDecoration decorationBorderContianet(Color color) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(30),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 5),
            spreadRadius: 10.0)
      ]);
}
BoxDecoration fondoDegradado() {
  return BoxDecoration(
      gradient: LinearGradient(colors: [
    azul(), //Azul
    azulOscuro(), //Azul Oscuro
    azulOscuro() //AzulOscuro
  ], stops: [
    0.2,
    0.58,
    0.7
  ], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter));
}

BoxDecoration fondoDegrdado2() {
  return BoxDecoration(
       gradient: LinearGradient(colors: [
    azul(), //Azul
    azulOscuro(), //Azul Oscuro
    azulOscuro() //AzulOscuro
  ], stops: [
    0.2,
    0.58,
    0.7
  ], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter),
      borderRadius: BorderRadius.circular(30),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 5),
            spreadRadius: 10.0)
      ]);
}

Future<void> mostrarAlerta(context, String message) async {

return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {

        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
          title: Text('Advertencia'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(message, style: TextStyle(fontSize: 20),),
            ],
          ),
          actions: <Widget>[
           
           ElevatedButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
       
      }

    );
}

 Widget crearBotonLogin(BuildContext context) {
    return Container(
        height: 30,
        width: 120,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          child: Center(
            child: Text(
              'Ingresar',
              style: TextStyle(color: Colors.blue[900]),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'login');
          },
        ));
  }

 Widget buscarGrupos() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Search',
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20))),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
      onTap: () {},
    );
  }

   Widget crearBotonRegister(BuildContext context) {
    return Container(
        height: 30,
        width: 150,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(azul20())),
          child: Center(
            child: Text('Crear cuenta'),
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
        ));
  }

  Widget layaout(BuildContext context, Widget pageWeb,  Widget pageWeb2, Widget pageMobil,) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1300) {
          return pageWeb;
        }
        if (constraints.maxWidth > 750) {
          return pageWeb2;
        } else {
          return pageMobil;
        }
      },
    );
  }
