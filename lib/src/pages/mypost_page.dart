import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/pages/perfil_page.dart';
import 'package:straussweb/src/utils/colors_utils.dart';
import 'dart:html' as html;

class MyPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: StreamBuilder<User>(
          stream: auth.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasData) {
              return _streamMyPost(
                  snapshot.data.uid, snapshot.data.displayName);
            } else {
              return Center(
                  child: Container(
                      child: _layout(
                _sinUsuarioIniciado(),
                _sinUsuarioIniciado(),
              )));
            }
          }),
    );
  }

  Widget _streamMyPost(String id, String nombre) {
    final Stream<DocumentSnapshot> _usersStream =
        FirebaseFirestore.instance.collection('mypost').doc(id).snapshots();
    return StreamBuilder<DocumentSnapshot>(
        stream: _usersStream,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          print(snapshot.data.data().toString());
          if (snapshot.data.data().toString() != '{initpost: initpost}') {
            Map<String, dynamic> data = snapshot.data.data();
            return Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: _myPost(data, nombre)),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 20,
              ),
              Text('Ya puedes comenzar a hacer tu perfil'),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: _floatingButton(context, id, nombre),
                  ))
            ],
          );
        });
  }

  FloatingActionButton _floatingButton(context, id, String nombre) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return PerfilPage(id, nombre);
              });
        });
  }

  Widget _sinUsuarioIniciado() {
    return Center(
      child: Text('Aqui podras poner tu perfil, pero antes inicia sesion.'),
    );
  }

  Widget _layout(Widget pageWeb, Widget pageMobil) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1300) {
          return pageWeb;
        }
        if (constraints.maxWidth > 750) {
          return pageWeb;
        } else {
          return pageMobil;
        }
      },
    );
  }

  Widget _myPost(Map<String, dynamic> data, nombre) {
    return Card(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 550,
                        child: _imagePortada(data['portada'])),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 400, left: 20, right: 20),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: FadeInImage(
                                image: _imageNetwork(),
                                placeholder: AssetImage('assets/loading.gif'),
                                fadeInDuration: Duration(milliseconds: 200),
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 140),
                            child: Container(
                              width: 200,
                              child: ListTile(
                                  title: SelectableText(
                                    '$nombre',
                                  ),
                                  subtitle:
                                      SelectableText('${data['subtitulo']}')),
                            ),
                          ),
                          //
                          // ),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.only(top: 160),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Informacion de contacto:'),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Telefono: '),
                                    SelectableText('${data['telefono']}')
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(59, 89, 152, 1))),
                                  child: Container(
                                      width: 120,
                                      child: Center(
                                          child: Text(
                                        'Facebook',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                  onPressed: () {
                                    html.window
                                        .open('${data['facebook']}', 'new tab');
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Una breve descripción de su carrera musical. ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                SelectableText('${data['general']}'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'InformacionPersonal',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 110),
                  child: Row(
                    children: [
                      Expanded(child: SelectableText('${data['personal']}')),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: Icon(
                          Icons.person_pin,
                          color: azulOscuro(),
                          size: 120,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'Ultimas participaciones',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 110),
                  child: Row(
                    children: [
                      Expanded(
                        child: SelectableText('${data['participaciones']}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: Icon(
                          Icons.event_available_sharp,
                          color: azulOscuro(),
                          size: 120,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'habilidades, especialidades e instrumentos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card(
                        child: Container(
                          width: 400,
                          child: Column(
                            children: [
                              Text(
                                'Habilidades',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SelectableText('${data['habilidad']}'),
                              SizedBox(
                                height: 60,
                              ),
                              Icon(
                                Icons.music_note,
                                color: azulOscuro(),
                                size: 60,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          width: 400,
                          child: Column(
                            children: [
                              Text(
                                'Especialidades',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SelectableText('${data['especialidad']}'),
                              SizedBox(
                                height: 60,
                              ),
                              Icon(
                                Icons.library_music_rounded,
                                color: azulOscuro(),
                                size: 60,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          width: 400,
                          child: Column(
                            children: [
                              Text(
                                'Instrumentos',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SelectableText('${data['instrumento']}'),
                              SizedBox(
                                height: 60,
                              ),
                              Icon(
                                Icons.queue_music_rounded,
                                color: azulOscuro(),
                                size: 60,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Grupos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SelectableText('${data['grupos']}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Icon(
                        Icons.group,
                        color: azulOscuro(),
                        size: 120,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget _imagePortada(String img) {
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
}

_imageNetwork() {
  return NetworkImage(
      'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg');
}
