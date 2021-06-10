import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return _helpWeb(context);
      }
      if (constraints.maxWidth > 800) {
        return _helpWeb(context);
      } else {
        return _helpMobil(context);
      }
    }));
  }

  Widget _helpWeb(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                '¿En que podemos ayudarte?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 550),
                child: Text(
                  'Temas populares',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _card(
                    Colors.blue,
                    'Configuracion de la cuenta',
                    NetworkImage(
                        'https://static.vecteezy.com/system/resources/previews/002/238/034/non_2x/account-settings-icon-flat-vector.jpg')),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _card(
                      Colors.red,
                      'Inicio de Sesion y contraseña',
                      NetworkImage(
                          'https://png.pngtree.com/png-vector/20191003/ourlarge/pngtree-user-login-or-authenticate-icon-on-gray-background-flat-icon-ve-png-image_1786166.jpg')),
                ),
                _card(
                    Colors.lightGreenAccent,
                    'Privacidad y seguridad',
                    NetworkImage(
                        'https://image.flaticon.com/icons/png/512/1698/1698540.png')),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _card(
                    Colors.blue,
                    'Informacion de Strauss',
                    NetworkImage(
                        'https://cdn.iconscout.com/icon/free/png-512/s-characters-character-alphabet-letter-36031.png')),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _card(
                      Colors.red,
                      'Dudas con el llenado de perfil',
                      NetworkImage(
                          'https://image.flaticon.com/icons/png/512/2502/2502505.png')),
                ),
                _card(
                    Colors.lightGreenAccent,
                    'Otros ',
                    NetworkImage(
                        'https://www.nicepng.com/png/detail/412-4122654_tuerca-png-setting-material-design-icon.png')),
              ]),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 550),
                child: Text(
                  'Informacion de contacto',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 800,
                height: 100,
                child: Card(
                  color: Color.fromRGBO(228, 230, 232, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('  Telefono: '), Text('2291370546')],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('  Correo electronico: '),
                          Text('StraussMX@hotmail.com')
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _helpMobil(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                '¿En que podemos ayudarte?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                'Temas populares',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                _card(
                    Colors.blue,
                    'Configuracion de la cuenta',
                    NetworkImage(
                        'https://static.vecteezy.com/system/resources/previews/002/238/034/non_2x/account-settings-icon-flat-vector.jpg')),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _card(
                      Colors.red,
                      'Inicio de Sesion y contraseña',
                      NetworkImage(
                          'https://png.pngtree.com/png-vector/20191003/ourlarge/pngtree-user-login-or-authenticate-icon-on-gray-background-flat-icon-ve-png-image_1786166.jpg')),
                ),
                _card(
                    Colors.lightGreenAccent,
                    'Privacidad y seguridad',
                    NetworkImage(
                        'https://image.flaticon.com/icons/png/512/1698/1698540.png')),
              ]),
              SizedBox(
                height: 10,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                _card(
                    Colors.blue,
                    'Informacion de Strauss',
                    NetworkImage(
                        'https://cdn.iconscout.com/icon/free/png-512/s-characters-character-alphabet-letter-36031.png')),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _card(
                      Colors.red,
                      'Dudas con el llenado de perfil',
                      NetworkImage(
                          'https://image.flaticon.com/icons/png/512/2502/2502505.png')),
                ),
                _card(
                    Colors.lightGreenAccent,
                    'Otros ',
                    NetworkImage(
                        'https://www.nicepng.com/png/detail/412-4122654_tuerca-png-setting-material-design-icon.png')),
              ]),
              SizedBox(
                height: 40,
              ),
              Text(
                'Informacion de contacto',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Card(
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: Color.fromRGBO(228, 230, 232, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('  Telefono: '), Text('2291370546')],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('  Correo electronico: '),
                          Text('StraussMX@hotmail.com')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _card(Color color, String titulo, NetworkImage img) {
    return Container(
        width: 250,
        height: 300,
        child: Card(
          color: Color.fromRGBO(228, 230, 232, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(228, 230, 232, 1),
                      backgroundImage: img,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 30, bottom: 10),
                child: Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 30, bottom: 10),
                child: Text(
                  'Cupidatat cupidatat consequat labore elit est nisi reprehenderit laboris.',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ));
  }
}
