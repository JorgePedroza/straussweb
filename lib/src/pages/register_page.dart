import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:straussweb/src/bloc/provider.dart';
import 'package:straussweb/src/services/usuario_provider.dart';

import 'package:straussweb/src/utils/colors_utils.dart';
import 'package:straussweb/src/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _sel = false;
  TextEditingController _inputFieldDateController = new TextEditingController();
  final usuarioProvider = new UsuarioProvider();

  DateTime _date;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return Scaffold(
            body: Container(
              decoration: fondoDegradado(),
              child: _loginWeb(bloc),
            ),
          );
        }
        if (constraints.maxWidth > 700) {
          return Scaffold(
            body: Container(
              decoration: fondoDegradado(),
              child: _loginWeb(bloc),
            ),
          );
        } else {
          return Scaffold(
              body: Container(
            decoration: fondoDegradado(),
            child: _loginMobil(bloc),
          ));
        }
      },
    );
  }

  Widget _loginWeb(bloc) {
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
                height: 700,
                width: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/ima6.png',
                      width: 400,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                        width: 400,
                        child: Text(
                          'Magna commodo id eiusmod laboris cillum excepteur duis excepteur non fugiat magna elit labore proident.',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                      height: 60,
                    ),
                    _bottonLogin(),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: decorationBorderContianet(azulOscuro()),
                height: 800,
                width: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Crear cuenta',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    _campoNombre(context, bloc),
                    _campoCorreo(context, bloc),
                    _campoFecha(context, bloc),
                    _campoContrasena(context, bloc),
                    _checkTerminos(context),
                    _bottonRegistrar(bloc)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginMobil(bloc) {
    return SingleChildScrollView(
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.white,
            height: 600,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/ima6.png',
                  width: 400,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 400,
                    child: Text(
                      'Magna commodo id eiusmod laboris cillum excepteur duis excepteur non fugiat magna elit labore proident.',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350, bottom: 100),
            child: Container(
              decoration: decorationBorderContianet(azulOscuro()),
              height: 800,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Crear cuenta',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  _campoNombre(context, bloc),
                  _campoCorreo(context, bloc),
                  _campoFecha(context, bloc),
                  _campoContrasena(context, bloc),
                  _checkTerminos(context),
                  _bottonRegistrar(bloc)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkTerminos(BuildContext context) {
    return Container(
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            fillColor: MaterialStateProperty.all(Colors.white),
            checkColor: azulOscuro(),
            value: _sel,
            onChanged: (bool resp) {
              setState(() {
                _sel = resp;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextButton(
              child: Text("Términos y Condiciones",
                  style: TextStyle(
                    fontSize: 20,
                  )),
              onPressed: () {
                // Navigator.pushNamed(context, "home");
              },
            ),
          ),
          Text('de uso.', style: TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _campoNombre(BuildContext context, bloc) {
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: Icon(
                    Icons.person_rounded,
                    color: azulOscuro(),
                  ), // myIcon is a 48px-wide widget.
                  errorText: snapshot.error,
                  errorStyle: TextStyle(fontSize: 15),
                  hintText: 'Nombre completo',
                ),
                onChanged: bloc.changeName),
          );
        });
  }

  Widget _campoCorreo(BuildContext context, bloc) {
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: Icon(
                    Icons.email,
                    color: azulOscuro(),
                  ), // myIcon is a 48px-wide widget.
                  errorText: snapshot.error,
                  errorStyle: TextStyle(fontSize: 15),
                  hintText: 'correo_ejemplo@mail.com',
                ),
                onChanged: bloc.changeEmail),
          );
        });
  }

  Widget _campoFecha(BuildContext context, bloc) {
    return StreamBuilder<Object>(
        stream: bloc.dateStream,
        builder: (context, snapshot) {
          return Container(
            width: 400,
            child: TextField(
              enableInteractiveSelection: false,
              controller: _inputFieldDateController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: Icon(
                  Icons.calendar_today_outlined,
                  color: azulOscuro(),
                ), // myIcon is a 48px-wide widget.
                errorText: snapshot.error,
                errorStyle: TextStyle(fontSize: 15),
                hintText: 'mm/dd/yyyy',
              ),
              onTap: () async {
                FocusScope.of(context).requestFocus(new FocusNode());
                await _selectDate(
                  context,
                );

                bloc.changeDate(_inputFieldDateController.text);
              },
            ),
          );
        });
  }

  Future _selectDate(
    BuildContext context,
  ) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        _date = picked;
        _inputFieldDateController.text = DateFormat.yMd().format(_date);
      });
    }
  }

  Widget _campoContrasena(BuildContext context, bloc) {
    return StreamBuilder<Object>(
        stream: bloc.passwordStream,
        builder: (context, snapshot) {
          return Container(
            width: 400,
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
                  errorStyle: TextStyle(fontSize: 15),
                  hintText: '*******',
                ),
                onChanged: bloc.changePassword),
          );
        });
  }

  Widget _bottonLogin() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromRGBO(12, 29, 45, 1.0))),
      child: Container(
        width: 180,
        child: Center(
            child: Text(
          'Inicar Sesion',
          style: TextStyle(fontSize: 20),
        )),
      ),
      onPressed: () {
        Navigator.pushNamed(context, 'login');
      },
    );
  }

  Widget _bottonRegistrar(bloc) {
    
    return StreamBuilder<Object>(
        stream: bloc.formValidStream,
        builder: (context, snapshot) {
          return ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              child: Container(
                width: 180,
                child: Center(
                    child: Text(
                  'Crear cuenta',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromRGBO(12, 29, 45, 1.0)),
                )),
              ),
              onPressed: snapshot.hasData
                  ? () {
                      if (_sel == true) {
                        _registerUser(bloc, context);
                        bloc.changePage('home');
                      } else {
                        _errorCampos('Error terminos y condiciones');
                      }
                    }
                  : null);
        });
  }

  _registerUser(bloc, BuildContext context) async {
    print('Se creo una cuenta');

    final info = await usuarioProvider.register(bloc.name, bloc.email, bloc.password, bloc.date);

    if (info['ok']) {
      Navigator.pushNamed(context, 'navegacion');
    } else {
      print(info['mensaje']);
       mostrarAlerta(context, info['mensaje']);
    }
  }

  _errorCampos(message) async {
     mostrarAlerta(context, message);
  }
}
