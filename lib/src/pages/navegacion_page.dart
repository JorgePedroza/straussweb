import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/bloc/provider.dart';
import 'package:straussweb/src/services/usuario_provider.dart';
import 'package:straussweb/src/pages/config_page.dart';
import 'package:straussweb/src/pages/help_page.dart';
import 'package:straussweb/src/pages/home_page.dart';
import 'package:straussweb/src/pages/mypost_page.dart';
import 'package:straussweb/src/utils/colors_utils.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
   
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SingleChildScrollView(
        child: Column(
          children: [
           AppBarPage(),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height - 60,
              child: StreamBuilder(
                stream: bloc.pageStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.data.toString()) {
                    case 'home':
                      return HomePage();
                      break;
                    case 'mypost':
                      return MyPostPage();
                      break;
                    case 'help':
                      return HelpPage();
                      break;
                    case 'config':
                      return ConfigPage();
                      break;

                    default:
                      return HomePage();
                      break;
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppBarPage extends StatefulWidget {
  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  Color _color1 = Color.fromRGBO(16, 30, 90, 1);
  Color _color2 = Colors.white;
  Color _color3 = Colors.white;
  Color _color4 = Colors.white;
  Color _color11 = Colors.white;
  Color _color22 = Colors.transparent;
  Color _color33 = Colors.transparent;
  Color _color44 = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1300) {
          return appBarWeb();
        }
        if (constraints.maxWidth > 750) {
          return appBarWeb2();
        } else {
          return appBarMobil();
        }
      },
    );
  }

  Widget appBarWeb() {
    return Container(
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              'assets/ima7.png',
              height: 45,
            ),
          ),
          Container(
            height: 40,
            width: 250,
            child: _buscarGrupos(),
          ),
          Expanded(
            child: Container(),
          ),
          ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(_color11),
              ),
              child: Container(
                  height: 60,
                  width: 82,
                  child: Tooltip(
                      message: 'Home',
                      child: Icon(Icons.home, size: 30, color: _color1))),
              onPressed: () {
                setState(() {
                  appBarNavigator(0);
                });
              }),
          ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(_color22),
              ),
              child: Container(
                  height: 60,
                  width: 82,
                  child: Tooltip(
                      message: 'Personal',
                      child:
                          Icon(Icons.person_sharp, size: 30, color: _color2))),
              onPressed: () {
                setState(() {
                  appBarNavigator(1);

                  // appBarNavigator();
                });
              }),
          ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(_color33),
              ),
              child: Container(
                  height: 60,
                  width: 82,
                  child: Tooltip(
                      message: 'Help',
                      child: Icon(Icons.help_center_rounded,
                          size: 30, color: _color3))),
              onPressed: () {
                setState(() {
                  appBarNavigator(2);
                  // appBarNavigator();
                });
              }),
          ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(_color44),
              ),
              child: Container(
                  height: 60,
                  width: 82,
                  child: Tooltip(
                      message: 'Settings',
                      child: Icon(Icons.settings, size: 30, color: _color4))),
              onPressed: () {
                setState(() {
                  appBarNavigator(3);
                  // appBarNavigator();
                });
              }),
          Expanded(
            child: Container(),
          ),
          _authOptions()
        ],
      ),
    );
  }

  Widget appBarWeb2() {
    return Container(
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              'assets/ima7.png',
              height: 45,
            ),
          ),
          Container(
            height: 40,
            width: 250,
            child: _buscarGrupos(),
          ),
          Expanded(
            child: Container(),
          ),
          ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(_color11),
              ),
              child: Container(
                  height: 60,
                  width: 82,
                  child: Tooltip(
                      message: 'Home',
                      child: Icon(Icons.home, size: 30, color: _color1))),
              onPressed: () {
                setState(() {
                  appBarNavigator(0);
                  //_page = 0;
                });
              }),
          ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(_color22),
              ),
              child: Container(
                  height: 60,
                  width: 82,
                  child: Tooltip(
                      message: 'Personal',
                      child:
                          Icon(Icons.person_sharp, size: 30, color: _color2))),
              onPressed: () {
                setState(() {
                  appBarNavigator(1);

                  // appBarNavigator();
                });
              }),
          ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(_color33),
              ),
              child: Container(
                  height: 60,
                  width: 82,
                  child: Tooltip(
                      message: 'Help',
                      child: Icon(Icons.help_center_rounded,
                          size: 30, color: _color3))),
              onPressed: () {
                setState(() {
                  appBarNavigator(2);
                  // appBarNavigator();
                });
              }),
          ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(_color44),
              ),
              child: Container(
                  height: 60,
                  width: 82,
                  child: Tooltip(
                      message: 'Settings',
                      child: Icon(Icons.settings, size: 30, color: _color4))),
              onPressed: () {
                setState(() {
                  appBarNavigator(3);
                  // appBarNavigator();
                });
              }),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget appBarMobil() {
    return Container(
      height: 100,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            color: Colors.blue[900],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    'assets/ima7.png',
                    height: 45,
                  ),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: _buscarGrupos(),
                ),
                _menuPop()
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(_color11),
                  ),
                  child: Container(
                      height: 40,
                      width: 45,
                      child: Tooltip(
                        message: 'Home',
                        child: Icon(Icons.home, size: 26, color: _color1),
                      )),
                  onPressed: () {
                    setState(() {
                      appBarNavigator(0);
                      //_page = 0;
                    });
                  }),
              ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(_color22),
                  ),
                  child: Container(
                      height: 40,
                      width: 45,
                      child: Tooltip(
                          message: 'Personal',
                          child: Icon(Icons.person_sharp,
                              size: 26, color: _color2))),
                  onPressed: () {
                    setState(() {
                      appBarNavigator(1);
                      // appBarNavigator();
                    });
                  }),
              ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(_color33),
                  ),
                  child: Container(
                      height: 40,
                      width: 45,
                      child: Tooltip(
                          message: 'Help',
                          child: Icon(Icons.help_center_rounded,
                              size: 26, color: _color3))),
                  onPressed: () {
                    setState(() {
                      appBarNavigator(2);
                      // appBarNavigator();
                    });
                  }),
              ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(_color44),
                  ),
                  child: Container(
                      height: 40,
                      width: 45,
                      child: Tooltip(
                          message: 'Settings',
                          child:
                              Icon(Icons.settings, size: 26, color: _color4))),
                  onPressed: () {
                    setState(() {
                      appBarNavigator(3);
                      // appBarNavigator();
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }

  appBarNavigator(option) {
    final bloc = Provider.of(context);
    switch (option) {
      case 0:
        _color1 = Color.fromRGBO(16, 30, 90, 1);
        _color2 = Colors.white;
        _color3 = Colors.white;
        _color4 = Colors.white;
        _color11 = Colors.white;
        _color22 = Colors.transparent;
        _color33 = Colors.transparent;
        _color44 = Colors.transparent;
        bloc.changePage('home');

        break;
      case 1:
        _color1 = Colors.white;
        _color2 = Color.fromRGBO(16, 30, 90, 1);
        _color3 = Colors.white;
        _color4 = Colors.white;
        _color11 = Colors.transparent;
        _color22 = Colors.white;
        _color33 = Colors.transparent;
        _color44 = Colors.transparent;
        bloc.changePage('mypost');

        return MyPostPage();
        break;
      case 2:
        _color1 = Colors.white;
        _color2 = Colors.white;
        _color3 = Color.fromRGBO(16, 30, 90, 1);
        _color4 = Colors.white;
        _color11 = Colors.transparent;
        _color22 = Colors.transparent;
        _color33 = Colors.white;
        _color44 = Colors.transparent;
        bloc.changePage('help');

        return HelpPage();
        break;
      case 3:
        _color1 = Colors.white;
        _color2 = Colors.white;
        _color3 = Colors.white;
        _color4 = Color.fromRGBO(16, 30, 90, 1);
        _color11 = Colors.transparent;
        _color22 = Colors.transparent;
        _color33 = Colors.transparent;
        _color44 = Colors.white;
        bloc.changePage('config');

        return ConfigPage();
        break;
      default:
        return HomePage();
    }
  }

  Widget _buscarGrupos() {
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

  Widget _crearBotonLogin(BuildContext context) {
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

  Widget _crearBotonRegister(BuildContext context) {
    return Container(
        height: 30,
        width: 150,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(16, 30, 90, 1))),
          child: Center(
            child: Text('Crear cuenta'),
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
        ));
  }

  Widget _menuPop() {
    return PopupMenuButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        onSelected: (selectedValue) {
          selectedValue
              ? Navigator.pushNamed(context, 'register')
              : Navigator.pushNamed(context, 'login');
        },
        itemBuilder: (BuildContext ctx) => [
              PopupMenuItem(child: Text('Crear cuenta'), value: true),
              PopupMenuItem(child: Text('Inicar Sesión'), value: false),
            ]);
  }

  Widget _authOptions() {
    FirebaseAuth auth = FirebaseAuth.instance;
    return StreamBuilder<User>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: CircleAvatar(
                      child: Text('JG'), backgroundColor: azulOscuro()),
                ),
                Container(
                    child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 120,
                        child: Text(
                          '${snapshot.data.displayName}',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: azulOscuro(),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          child: Icon(
                            Icons.call_missed_outgoing_sharp,
                            color: azulOscuro(),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                          onPressed: () {
                            UsuarioProvider f = UsuarioProvider();
                            f.logout();
                            Navigator.pushReplacementNamed(
                                context, 'navegacion');
                          })
                    ],
                  ),
                )),
              ],
            );
          } else {
            return Row(
              children: [
                _crearBotonLogin(context),
                SizedBox(
                  width: 10,
                ),
                _crearBotonRegister(context),
                SizedBox(
                  width: 10,
                ),
              ],
            );
          }
        });
  }
}
