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