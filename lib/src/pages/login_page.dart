import 'package:flutter/material.dart';
import 'package:straussweb/src/bloc/provider.dart';
import 'package:straussweb/src/services/usuario_provider.dart';
import 'package:straussweb/src/utils/colors_utils.dart';
import 'package:straussweb/src/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  final usuarioProvider = new UsuarioProvider();
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return Scaffold(
            body: Container(
              decoration: fondoDegradado(),
              child: _loginWeb(context, bloc),
            ),
          );
        }
        if (constraints.maxWidth > 700) {
          return Scaffold(
            body: Container(
              decoration: fondoDegradado(),
              child: _loginWeb(context, bloc),
            ),
          );
        } else {
          return Scaffold(
              body: Container(
            decoration: fondoDegradado(),
            child: _loginMobil(context, bloc),
          ));
        }
      },
    );
  }

  Widget _loginWeb(BuildContext context, bloc) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Center(
        widthFactor: 1.6,
        child: Container(
          height: 800,
          width: 1200,
          decoration: decorationBorderContianet(Colors.transparent),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: decorationBorderContianet(Colors.white),
                height: 600,
                width: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Iniciar Sesion',
                      style: TextStyle(fontSize: 30, color: azulOscuro()),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    _campoCorreo(context, bloc),
                    SizedBox(
                      height: 20,
                    ),
                    _campoContrasena(context, bloc),
                    SizedBox(
                      height: 110,
                    ),
                    _bottonLogin(bloc)
                  ],
                ),
              ),
              Container(
                decoration: decorationBorderContianet(azulOscuro()),
                height: 800,
                width: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'strauss',
                      child: Image.asset(
                        'assets/ima5.png',
                        width: 400,
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                        width: 400,
                        child: Text(
                          'Magna commodo id eiusmod laboris cillum excepteur duis excepteur non fugiat magna elit labore proident.',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                      height: 60,
                    ),
                    _bottonRegistrar(context),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginMobil(BuildContext context, bloc) {
    return SingleChildScrollView(
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: azulOscuro(),
            height: 500,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/ima5.png',
                  width: 400,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 400,
                    child: Text(
                      'Magna commodo id eiusmod laboris cillum excepteur duis excepteur non fugiat magna elit labore proident.',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 350,
            ),
            child: Container(
              decoration: decorationBorderContianet(Colors.white),
              height: 800,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Iniciar Sesion',
                    style: TextStyle(fontSize: 30, color: azulOscuro()),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  _campoCorreo(context, bloc),
                  SizedBox(
                    height: 20,
                  ),
                  _campoContrasena(context, bloc),
                  SizedBox(
                    height: 110,
                  ),
                  _bottonLogin(bloc)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _campoCorreo(BuildContext context, bloc) {
    return StreamBuilder<Object>(
        stream: bloc.emailStream,
        builder: (context, snapshot) {
          return Container(
            width: 500,
            child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: Icon(
                    Icons.email,
                    color: azulOscuro(),
                  ),
                  errorText: snapshot.error,
                  hintText: 'correo_ejemplo@mail.com',
                ),
                onChanged: bloc.changeEmail),
          );
        });
  }

  Widget _campoContrasena(BuildContext context, bloc) {
    return StreamBuilder<Object>(
        stream: bloc.passwordStream,
        builder: (context, snapshot) {
          return Container(
            width: 500,
            child: TextField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(),
                    child: Icon(
                      Icons.lock_outline,
                      color: azulOscuro(),
                    ), // myIcon is a 48px-wide widget.
                  ),
                  errorText: snapshot.error,
                  hintText: '*******',
                ),
                onChanged: bloc.changePassword),
          );
        });
  }

  Widget _bottonLogin(bloc) {
    return StreamBuilder(
        stream: bloc.formValidStreamLogin,
        builder: (context, snapshot) {
          return ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(azulOscuro())),
              child: Container(
                width: 180,
                child: Center(
                    child: Text(
                  'Inicar Sesion',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ),
              onPressed: () {
                if (snapshot.hasData) {
                  _loginUser(bloc, context);
                  bloc.changePage('0');
                } else {
                  return null;
                }
              });
        });
  }

  Widget _bottonRegistrar(context) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
      child: Container(
        width: 180,
        child: Center(
            child: Text(
          'Crear cuenta',
          style:
              TextStyle(fontSize: 20, color: Color.fromRGBO(12, 29, 45, 1.0)),
        )),
      ),
      onPressed: () {
        Navigator.popAndPushNamed(context, 'register');
      },
    );
  }

  _loginUser(bloc, BuildContext context) async {
    print('entro');

    final info = await usuarioProvider.login(bloc.email, bloc.password);

    if (info['ok']) {
      Navigator.pop(context);
    } else {
      print(info['mensaje']);
      mostrarAlerta(context, info['mensaje']);
    }
  }
}
