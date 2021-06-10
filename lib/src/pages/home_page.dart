import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/utils/colors_utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _visible = true;
  bool _visible1 = true;
  bool _visible2 = true;
  bool _visible3 = true;
  bool _visible4 = true;

  FirebaseAuth auth = FirebaseAuth.instance;
   void _loadData() async {
    await Future.delayed(Duration(milliseconds: 2500));
    setState(() {
      _visible = false;
    });
  }


  void _loadData1() async {
    await Future.delayed(Duration(milliseconds:1000));
    setState(() {
      _visible1 = false;
    });
  }

  void _loadData2() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _visible2 = false;
    });
  }

  void _loadData3() async {
    await Future.delayed(Duration(milliseconds: 2000));
    setState(() {
      _visible3 = false;
    });
  }

  void _loadData4() async {
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      _visible4 = false;
    });
  }

  @override
  void initState() {
    _loadData();
    _loadData1();
    _loadData2();
    _loadData3();
    _loadData4();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: Colors.white,
            );
          }
          return Scaffold(
              body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                color: azulOscuro(),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _cuadroImgen1('assets/img3.jpg', 100, 0),
                    SizedBox(
                      width: 15,
                    ),
                    _cuadroImgen2('assets/imghome2.jpg', 0, 100),
                    SizedBox(
                      width: 15,
                    ),
                    _cuadroImgen3('assets/imghome3.jpg', 100, 0),
                    SizedBox(
                      width: 15,
                    ),
                    _cuadroImgen4('assets/imghom4.jpg', 0, 100),
                    SizedBox(
                      width: 15,
                    ),
                    AnimatedOpacity(
                      opacity: _visible ? 0.0 : 1,
                      duration: Duration(seconds: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Hero(
                            tag: 'strauss',
                            child: Image.asset(
                              'assets/ima5.png',
                              width: 600,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                            width: 500,
                            child: SelectableText(
                              'Ipsum enim dolor reprehenderit culpa occaecat non deserunt reprehenderit sunt.Pariatur eiusmod proident sint tempor magna mollit dolore aliqua consequat do veniam.Velit ipsum culpa esse velit labore minim irure labore non.',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ));
        });
  }

  Widget _cuadroImgen1(String path, double top, double bottom) {
    return AnimatedOpacity(
        // Si el Widget debe ser visible, anime a 1.0 (completamente visible). Si
        // el Widget debe estar oculto, anime a 0.0 (invisible).
        opacity: _visible1 ? 0.0 : 1,
        duration: Duration(seconds: 2),
        // El cuadro debe ser el hijo de AnimatedOpacity
        child: Container(
            padding: EdgeInsets.only(top: top, bottom: bottom),
            width: 240,
            height: 700,
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            )));
  }

  Widget _cuadroImgen2(String path, double top, double bottom) {
    return AnimatedOpacity(
        // Si el Widget debe ser visible, anime a 1.0 (completamente visible). Si
        // el Widget debe estar oculto, anime a 0.0 (invisible).
        opacity: _visible2 ? 0.0 : 1,
        duration: Duration(seconds: 2),
        // El cuadro debe ser el hijo de AnimatedOpacity
        child: Container(
            padding: EdgeInsets.only(top: top, bottom: bottom),
            width: 240,
            height: 700,
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            )));
  }

  Widget _cuadroImgen3(String path, double top, double bottom) {
    return AnimatedOpacity(
        // Si el Widget debe ser visible, anime a 1.0 (completamente visible). Si
        // el Widget debe estar oculto, anime a 0.0 (invisible).
        opacity: _visible3 ? 0.0 : 1,
        duration: Duration(seconds: 2),
        // El cuadro debe ser el hijo de AnimatedOpacity
        child: Container(
            padding: EdgeInsets.only(top: top, bottom: bottom),
            width: 240,
            height: 700,
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            )));
  }

  Widget _cuadroImgen4(String path, double top, double bottom) {
    return AnimatedOpacity(
        // Si el Widget debe ser visible, anime a 1.0 (completamente visible). Si
        // el Widget debe estar oculto, anime a 0.0 (invisible).
        opacity: _visible4 ? 0.0 : 1,
        duration: Duration(seconds: 2),
        // El cuadro debe ser el hijo de AnimatedOpacity
        child: Container(
            padding: EdgeInsets.only(top: top, bottom: bottom),
            width: 240,
            height: 700,
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            )));
  }
}
