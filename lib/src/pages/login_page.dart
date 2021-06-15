import 'package:flutter/material.dart';
import 'package:straussweb/src/bloc/provider.dart';
import 'package:straussweb/src/services/usuario_provider.dart';
import 'package:straussweb/src/utils/colors_utils.dart';
import 'package:straussweb/src/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  final usuarioProvider = new UsuarioProvider();
  static double alto = 0;
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    
 
    if(MediaQuery.of(context).size.height >= 670){
      alto = MediaQuery.of(context).size.height * 0.8;
    
    }else{
      alto = 630;
    }
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: fondoDegradado(),
      child: layaout(
          context,
          _loginWeb(context, bloc,alto),
          _loginWeb2(context, bloc),
          Container(
              width: double.infinity,
              height: double.infinity,
              color: azulOscuro(),
              child: _loginMobil(context, bloc))),
    ));
  }

  Widget _loginWeb(BuildContext context, bloc, alto) {
    return SingleChildScrollView(
      child: 
           Column(
             children: [
               SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Card(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            decoration: decorationBorderContianet(Colors.white),
                            height:500,
                            width: 600,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 70),
                                  child: Text(
                                    'Iniciar Sesion',
                                    style: TextStyle(fontSize: 30, color: azulOscuro()),
                                  ),
                                ),
                               
                                Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: _campoCorreo(context, bloc),
                                ),
                                
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: _campoContrasena(context, bloc),
                                ),
                                
                                Padding(
                                  padding: const EdgeInsets.only(top: 70),
                                  child: _bottonLogin(bloc),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.transparent,
                        child: Container(
                          decoration: decorationBorderContianet(azulOscuro()),
                          height: alto,
                          width: 600,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:EdgeInsets.only(top: MediaQuery.of(context).size.height *0.1 ),
                                child: Hero(
                                  tag: 'strauss',
                                  child: Image.asset(
                                    'assets/ima5.png',
                                    width: 400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Text(
                                  'Magna commodo id eiusmod laboris cillum excepteur duis excepteur non fugiat magna elit labore proident.',
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 80),
                                child: _bottonRegistrar(context),
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
  Widget _loginWeb2(BuildContext context, bloc) {
    return SingleChildScrollView(
      child: 
           Column(
             
             children: [
               SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          decoration: decorationBorderContianet(Colors.white),
                          height:600,
                          width: 600,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 70),
                                child: Text(
                                  'Iniciar Sesion',
                                  style: TextStyle(fontSize: 30, color: azulOscuro()),
                                ),
                              ),
                             
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: _campoCorreo(context, bloc),
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: _campoContrasena(context, bloc),
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.only(top: 70),
                                child: _bottonLogin(bloc),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
             ],
           ),
        
     
    );
  }

  Widget _loginMobil(BuildContext context, bloc) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          backgroundColor: azulOscuro(),
          elevation: 1,
          pinned: false,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: 'strauss',
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/ima5.png',
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
              ),
            ),
          ),
        ),

        // Anther sliver widget: SliverList
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              decoration: decorationBorderContianet(Colors.white),
              height: 800,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Iniciar Sesion',
                    style: TextStyle(fontSize: 30, color: azulOscuro()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: _campoCorreo(context, bloc),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: _campoContrasena(context, bloc),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  _bottonLogin(bloc)
                ],
              ),
            )
          ]),
        ),
      ],
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
                    borderRadius: BorderRadius.circular(8),
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
                    borderRadius: BorderRadius.circular(8),
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
        Navigator.pushNamed(context, 'register');
      },
    );
  }

  _loginUser(bloc, BuildContext context) async {
    

    final info = await usuarioProvider.login(bloc.email, bloc.password);

    if (info['ok']) {
      Navigator.pushNamed(context, 'status');
    } else {
      print(info['mensaje']);
      mostrarAlerta(context, info['mensaje']);
    }
  }
}
