import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/bloc/login_bloc.dart';
import 'package:straussweb/src/bloc/provider.dart';
import 'package:straussweb/src/services/usuario_provider.dart';
import 'package:straussweb/src/utils/colors_utils.dart';
import 'package:straussweb/src/widgets/widgets.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final g = FirebaseAuth.instance.currentUser;
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: Alignment.topCenter,
      child: Card(
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: double.infinity,
          child: _informacionPerfil(
            g.uid.toString(),
          ),
        ),
      ),
    ));
  }

  Widget _informacionPerfil(String path) {
    final Stream<DocumentSnapshot> _usersStream =
        FirebaseFirestore.instance.collection('usuarios').doc(path).snapshots();
    return StreamBuilder(
        stream: _usersStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data.data();
            print(data["displayName"]);
            return SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Informacion de perfil',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: FadeInImage(
                      image: NetworkImage(data["url"]),
                      placeholder: AssetImage('assets/loading.gif'),
                      fadeInDuration: Duration(milliseconds: 200),
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${data["displayName"]}',
                    style: TextStyle(fontSize: 30, color: azulOscuro()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Id de usuario: ${data["id"]}',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    color: Colors.black38,
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 2,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Nombre: ',
                            style: TextStyle(fontSize: 23, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Email: ',
                            style: TextStyle(fontSize: 23, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Fecha de nacimiento: ',
                            style: TextStyle(fontSize: 23, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Imagen: ',
                            style: TextStyle(fontSize: 23, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Id de usuario: ',
                            style: TextStyle(fontSize: 23, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data["displayName"]}',
                            style: TextStyle(fontSize: 23),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${data["email"]}',
                            style: TextStyle(fontSize: 23),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${data["lastSign"]}',
                            style: TextStyle(fontSize: 23),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${data["url"]}',
                            style: TextStyle(fontSize: 23),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${data["id"]}',
                            style: TextStyle(fontSize: 23),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  width: 280,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(azulOscuro())),
                      child: Center(
                        child: Container(
                          height: 40,
                          child: Text(
                            'Editar Perfil',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return editarPerfil(
                                path,
                                data["lastSign"],
                              );
                            });
                      }),
                ),
              ],
            ));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget editarPerfil(String id, fecha) {
    final bloc = Provider.of(context);
    bloc.changeImage(g.photoURL);
    bloc.changeName(g.displayName);
    bloc.changeEmail(g.email);
    return AlertDialog(
    
      content: Container(
        width: 900,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Editar Perfil',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        _fotoDePerfil(bloc),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Nombre: ',
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Text(
                          'Email: ',
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Text(
                          'Fecha de nacimiento: ',
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Id de usuario: ',
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 150),
                            child: _campofoto(context, bloc),
                          ),
                          SizedBox(
                            height: 150,
                          ),
                          _campoNombre(context, bloc),
                          SizedBox(
                            height: 50,
                          ),
                          _campoCorreo(context, bloc),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            fecha,
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            id,
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              _botones(bloc)
            ],
          ),
        ),
      ),
    );
  }

  Widget _campofoto(BuildContext context, LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.imageStream,
        builder: (context, snapshot) {
          return Container(
            width: 500,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: Icon(
                  Icons.image,
                  color: azulOscuro(),
                ),
                hintText: 'inserta el URL de la imagen nueva',
              ),
              onChanged: bloc.changeImage,
            ),
          );
        });
  }

  Widget _fotoDePerfil(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.imageStream,
        builder: (context, snapshot) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: FadeInImage(
                image: NetworkImage(bloc.image),
                placeholder: AssetImage('assets/loading.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }

  Widget _campoNombre(BuildContext context, LoginBloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.nameStream,
        builder: (context, snapshot) {
          return Container(
            width: 400,
            child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: Icon(
                    Icons.person_rounded,
                    color: azulOscuro(),
                  ), // myIcon is a 48px-wide widget.
                  errorText: snapshot.error,
                  errorStyle: TextStyle(fontSize: 15),
                  hintText: bloc.name,
                ),
                onChanged: bloc.changeName),
          );
        });
  }

  Widget _campoCorreo(BuildContext context, LoginBloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.emailStream,
        builder: (context, snapshot) {
          return Container(
            width: 400,
            child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: Icon(
                    Icons.email,
                    color: azulOscuro(),
                  ), // myIcon is a 48px-wide widget.
                  errorText: snapshot.error,
                  errorStyle: TextStyle(fontSize: 15),
                  hintText: bloc.email,
                ),
                onChanged: bloc.changeEmail),
          );
        });
  }

  Widget _botones(LoginBloc bloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          child: Container(
            width: 100,
            child: Center(
              child: Text('Cancelar'),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          width: 10,
        ),
        StreamBuilder(
            stream: bloc.formValidStreamUpdate,
            builder: (context, snapshot) {
              return ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(azulOscuro())),
                  child: Container(
                    width: 100,
                    child: Center(
                      child: Text('Agregar'),
                    ),
                  ),
                  onPressed: () async {
                    if (snapshot.hasData) {
                    _actualizarUser(bloc, context);
                    bloc.changePage("3");
                     
                    } else {
                      return null;
                    }
                  });
            }),
      ],
    );
  }

 Future _actualizarUser(LoginBloc bloc, BuildContext context) async {
    print('Se creo una cuenta');

    final info = await usuarioProvider.actualizar(
      bloc.name,
      bloc.email,
      bloc.image,
    );

    if (info['ok']) {
     Navigator.pushReplacementNamed(context, "status");
    } else {
      print(info['mensaje']);
      mostrarAlerta(context, info['mensaje']);
    }
  }
}
