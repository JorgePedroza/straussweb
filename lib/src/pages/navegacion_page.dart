import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/bloc/login_bloc.dart';
import 'package:straussweb/src/bloc/provider.dart';
import 'package:straussweb/src/services/usuario_provider.dart';
import 'package:straussweb/src/pages/config_page.dart';
import 'package:straussweb/src/pages/help_page.dart';
import 'package:straussweb/src/pages/home_page.dart';
import 'package:straussweb/src/pages/mypost_page.dart';
import 'package:straussweb/src/utils/colors_utils.dart';
import 'package:straussweb/src/widgets/widgets.dart';

class NavegacionPage extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      backgroundColor: azulOscuro(),
      body: layaout(
          context,
          Stack(
            children: [
              _pageActual(context, bloc),
              appBarWeb(context),
            ],
          ),
          Stack(
            children: [
              _pageActual(context, bloc),
              appBarWeb2(context),
            ],
          ),
          appBarMobil(context, bloc)),
    );
  }

  Widget _pageActual(BuildContext context, bloc) {
    return Column(
      children: [
        Container(
          height: 60,
        ),
        Container(
          height: MediaQuery.of(context).size.height - 60,
          child: StreamBuilder(
            stream: bloc.pageStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.data.toString()) {
                case '0':
                  return HomePage();
                  break;
                case '1':
                  return MyPostPage();
                  break;
                case '2':
                  return HelpPage();
                  break;
                case '3':
                  return ConfigPage();
                  break;
                default:
                  return HomePageOff();
                  break;
              }
            },
          ),
        ),
      ],
    );
  }

  Widget appBarWeb(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Image.asset(
            'assets/ima7.png',
            height: 45,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: streamBusqueda(context),
        ),
        Expanded(
          child: Container(
            height: 60,
          ),
        ),
        ItemsBar(),
        Expanded(
          child: Container(
            height: 60,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: _authOptions(),
        )
      ],
    );
  }

  Widget appBarWeb2(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Image.asset(
            'assets/ima7.png',
            height: 45,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: streamBusqueda(context),
        ),
        Expanded(
          child: Container(),
        ),
        ItemsBar(),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }

  Widget appBarMobil(BuildContext context, bloc) {
    return DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: azulOscuro(),
              pinned: false,
              snap: false,
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      'assets/ima7.png',
                      height: 45,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: buscarGrupos(context),
                  ),
                  _menuPop(context)
                ],
              ),
              bottom: TabBar(
                onTap: (i) {
                  bloc.changePage('$i');
                },
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    icon: Icon(Icons.person_sharp),
                  ),
                  Tab(
                    icon: Icon(Icons.help_center_rounded),
                  ),
                  Tab(
                    icon: Icon(Icons.settings),
                  )
                ],
              ),
            ),

            // Anther sliver widget: SliverList
            SliverList(
              delegate: SliverChildListDelegate([_pageActual(context, bloc)]),
            ),
          ],
        ));
  }

  Widget _menuPop(BuildContext context) {
    return StreamBuilder(
        stream: auth.authStateChanges(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          if (snapshot.hasData) {
            return PopupMenuButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                ),
                onSelected: (selectedValue) {
                  if (!selectedValue) {
                    auth.signOut();
                    Navigator.pushReplacementNamed(context, 'status');
                  } else {}
                },
                itemBuilder: (BuildContext ctx) => [
                      PopupMenuItem(
                          child: Text(snapshot.data.displayName), value: true),
                      PopupMenuItem(child: Text('Cerrar sesion'), value: false),
                    ]);
          }
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
        });
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
                  margin: EdgeInsets.only(right: 20.0),
                  child: avatrImage(auth.currentUser.uid),
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
                            Icons.logout,
                            color: Colors.white,
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(azulOscuro()),
                          ),
                          onPressed: () {
                            UsuarioProvider f = UsuarioProvider();
                            final bloc = Provider.of(context);
                            f.logout();
                            Navigator.pushReplacementNamed(context, 'status');
                            bloc.changePage('0');
                          })
                    ],
                  ),
                )),
              ],
            );
          } else {
            return Row(
              children: [
                crearBotonLogin(context),
                SizedBox(
                  width: 10,
                ),
                crearBotonRegister(context),
                SizedBox(
                  width: 10,
                ),
              ],
            );
          }
        });
  }

  Widget avatrImage(id) {
    final Stream<DocumentSnapshot> _usersStream =
        FirebaseFirestore.instance.collection('usuarios').doc(id).snapshots();
    return StreamBuilder(
        stream: _usersStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data.data();
            return CircleAvatar(
                backgroundImage: NetworkImage(data["url"]),
                backgroundColor: azulOscuro());
          }
          return CircularProgressIndicator();
        
        });
  }
}

class NavegacionPageOff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
        backgroundColor: azulOscuro(),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              _pageHome(context),
              layaout(context, _appbarWeb(context, bloc),
                  _appbarWeb(context, bloc), _appbarMobil(context)),
            ],
          ),
        ));
  }

  Widget _appbarWeb(BuildContext context, bloc) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              'assets/ima7.png',
              height: 45,
            ),
          ),
          streamBusqueda(context),
          Expanded(
            child: Container(),
          ),
          Row(
            children: [
              crearBotonLogin(context),
              SizedBox(
                width: 10,
              ),
              crearBotonRegister(context),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _appbarMobil(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/ima7.png',
            height: 45,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: streamBusqueda(context)),
          _menuPop(
            context,
          )
        ],
      ),
    );
  }

  Widget _pageHome(BuildContext context) {
    return Column(
      children: [
        Container(height: 60),
        Container(
            height: MediaQuery.of(context).size.height - 60,
            child: HomePageOff()),
      ],
    );
  }

  Widget _menuPop(BuildContext context) {
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
}

class ItemsBar extends StatefulWidget {
  @override
  _ItemsBarState createState() => _ItemsBarState();
}

class _ItemsBarState extends State<ItemsBar> {
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
    final bloc = Provider.of(context);
    colorState(bloc);
    return Row(
      children: [
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
                colorState(bloc);
                bloc.changePage('0');
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
                    child: Icon(Icons.person_sharp, size: 30, color: _color2))),
            onPressed: () {
              setState(() {
                colorState(bloc);
                bloc.changePage('1');
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
                colorState(bloc);
                bloc.changePage('2');
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
              colorState(bloc);
              setState(() {
                bloc.changePage('3');
              });
            }),
      ],
    );
  }

  colorState(LoginBloc bloc) {
    switch (bloc.page) {
      case '0':
        _color1 = Color.fromRGBO(16, 30, 90, 1);
        _color2 = Colors.white;
        _color3 = Colors.white;
        _color4 = Colors.white;
        _color11 = Colors.white;
        _color22 = Colors.transparent;
        _color33 = Colors.transparent;
        _color44 = Colors.transparent;
        break;
      case '1':
        _color1 = Colors.white;
        _color2 = Color.fromRGBO(16, 30, 90, 1);
        _color3 = Colors.white;
        _color4 = Colors.white;
        _color11 = Colors.transparent;
        _color22 = Colors.white;
        _color33 = Colors.transparent;
        _color44 = Colors.transparent;
        break;
      case '2':
        _color1 = Colors.white;
        _color2 = Colors.white;
        _color3 = Color.fromRGBO(16, 30, 90, 1);
        _color4 = Colors.white;
        _color11 = Colors.transparent;
        _color22 = Colors.transparent;
        _color33 = Colors.white;
        _color44 = Colors.transparent;
        break;
      case '3':
        _color1 = Colors.white;
        _color2 = Colors.white;
        _color3 = Colors.white;
        _color4 = Color.fromRGBO(16, 30, 90, 1);
        _color11 = Colors.transparent;
        _color22 = Colors.transparent;
        _color33 = Colors.transparent;
        _color44 = Colors.white;
        break;

      default:
        _color1 = Color.fromRGBO(16, 30, 90, 1);
        _color2 = Colors.white;
        _color3 = Colors.white;
        _color4 = Colors.white;
        _color11 = Colors.white;
        _color22 = Colors.transparent;
        _color33 = Colors.transparent;
        _color44 = Colors.transparent;
    }
  }
}
