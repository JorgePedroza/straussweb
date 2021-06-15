import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/bloc/provider.dart';
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Advertencia'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                message,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
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

Widget streamBusqueda(context) {
  Color _color = Colors.transparent;
  double _alto = 0;
  final bloc = Provider.of(context);
  FirebaseFirestore.instance.collection('mypost')
                              .get()
                              .then((QuerySnapshot querySnapshot) {
                            querySnapshot.docs.forEach((doc) {
                              Map<String, dynamic> data =  doc.data() as Map<String, dynamic>;
                              print(data["telefono"]);
                            });
                          });
 
 
  return StreamBuilder<Object>(
      stream: bloc.searchStream,
      builder: (context, snapshot) {
      
        if (snapshot.data == true) {
          _color = Colors.white;
          _alto = 200;
        } else {
          _color = Colors.transparent;
          _alto = 00;
        }
        return Container(
          height: 400,
          width: 250,
          child: Column(
            children: [
              buscarGrupos(context),
              SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                height: _alto,
                width: 250,
                decoration: BoxDecoration(
                    color: _color, borderRadius: BorderRadius.circular(10)),
                duration: Duration(milliseconds: 200),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Text('1'),
                        Text('2'),
                        Text('3'),
                        Text('4'),
                        Text('5'),
                        Text('6'),
                        Text('7'),
                        Text('8'),
                        Text('9'),
                        Text('10'),
                        Text('11'),
                        Text('12'),
                        Text('13'),
                        Text('14'),
                        Text('15'),
                        Text('16'),
                        Text('17'),
                        Text('18'),
                        Text('19'),
                        Text('20'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
}

Widget buscarGrupos(BuildContext context) {
  final bloc = Provider.of(context);
  return TextField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      hintText: 'Search',
      contentPadding: EdgeInsets.symmetric(vertical: 5),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20), topRight: Radius.circular(20))),
      prefixIcon: const Icon(
        Icons.search,
        color: Colors.black,
      ),
    ),
    onTap: () {},
    onChanged: (v) {
    
      if (v.length > 1) {
        bloc.changeSearch(true);
      } else {
        bloc.changeSearch(false);
      }
    },
  );

  //
}

Widget crearBotonRegister(BuildContext context) {
  return Container(
      height: 30,
      width: 150,
      child: ElevatedButton(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(azul20())),
        child: Center(
          child: Text('Crear cuenta'),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'register');
        },
      ));
}

Widget layaout(
  BuildContext context,
  Widget pageWeb,
  Widget pageWeb2,
  Widget pageMobil,
) {
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
  Widget imagePortada(String img) {

    switch (img) {
      case '1':
        return FadeInImage(
          image: NetworkImage(
              'https://static2.abc.es/media/cultura/2019/09/26/beatlesss-kY2D--620x349@abc.jpg'),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.fitWidth,
        );
        break;
      case '2':
        return FadeInImage(
          image: NetworkImage(
              'https://www.anahuac.mx/veracruz/sites/default/files/2019-11/concierto-orquesta-filarmonica-xalapa_fbtw.jpg'),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.fitWidth,
        );
        break;
      case '3':
        return FadeInImage(
          image: NetworkImage(
              'https://ep00.epimg.net/cultura/imagenes/2016/01/04/actualidad/1451873486_818047_1451874168_noticia_normal.jpg'),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.fitWidth,
        );
        break;
      case '4':
        return FadeInImage(
          image: NetworkImage(
              'https://www.musicalesyeventosanha.com/blog/wp-content/uploads/2014/01/Tenor-violinista-y-organista-en-boda-religiosa.jpg'),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.fitWidth,
        );

      default:
        return FadeInImage(
          image: NetworkImage(
              'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.fitWidth,
        );
    }
  }

  imageNetwork() {
  return NetworkImage(
      'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg');
}