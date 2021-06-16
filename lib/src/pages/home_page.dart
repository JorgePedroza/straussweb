import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:straussweb/src/utils/colors_utils.dart';
import 'package:straussweb/src/widgets/widgets.dart';

class HomePageOff extends StatefulWidget {
  @override
  _HomePageOffState createState() => _HomePageOffState();
}

class _HomePageOffState extends State<HomePageOff> {
  bool _visible = true;
  bool _visible1 = true;
  bool _visible2 = true;
  bool _visible3 = true;
  bool _visible4 = true;

  FirebaseAuth auth = FirebaseAuth.instance;
  _loadData() async {
    await Future.delayed(Duration(milliseconds: 2500));
    if (!mounted) return;
    setState(() {
      _visible = false;
    });
  }

  _loadData1() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (!mounted) return;
    setState(() {
      _visible1 = false;
    });
  }

  _loadData2() async {
    await Future.delayed(Duration(milliseconds: 500));
    if (!mounted) return;
    setState(() {
      _visible2 = false;
    });
  }

  _loadData3() async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (!mounted) return;
    setState(() {
      _visible3 = false;
    });
  }

  _loadData4() async {
    await Future.delayed(Duration(milliseconds: 1500));
    if (!mounted) return;
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
    return Scaffold(
        backgroundColor: azulOscuro(),
        body: layaout(context, _pageWeb(), _pageWeb2(), _pageMobil()));
  }

  Widget _pageWeb() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _cuadroImgen1(
                'assets/img3.jpg',
                100,
                0,
                MediaQuery.of(context).size.width * 0.12,
                MediaQuery.of(context).size.height * 0.85,
              ),
              SizedBox(
                width: 15,
              ),
              _cuadroImgen2(
                  'assets/imghome2.jpg',
                  0,
                  100,
                  MediaQuery.of(context).size.width * 0.12,
                  MediaQuery.of(context).size.height * 0.85),
              SizedBox(
                width: 15,
              ),
              _cuadroImgen3(
                  'assets/imghome3.jpg',
                  100,
                  0,
                  MediaQuery.of(context).size.width * 0.12,
                  MediaQuery.of(context).size.height * 0.85),
              SizedBox(
                width: 15,
              ),
              _cuadroImgen4(
                  'assets/imghom4.jpg',
                  0,
                  100,
                  MediaQuery.of(context).size.width * 0.12,
                  MediaQuery.of(context).size.height * 0.85),
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
                        width: MediaQuery.of(context).size.width * 0.35,
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
        ],
      ),
    );
  }

  Widget _pageWeb2() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _cuadroImgen1(
                  'assets/img3.jpg',
                  100,
                  0,
                  MediaQuery.of(context).size.width * 0.27,
                  MediaQuery.of(context).size.height * 0.85),
              SizedBox(
                width: 15,
              ),
              _cuadroImgen2(
                  'assets/imghome2.jpg',
                  0,
                  100,
                  MediaQuery.of(context).size.width * 0.27,
                  MediaQuery.of(context).size.height * 0.85),
              SizedBox(
                width: 15,
              ),
              _cuadroImgen3(
                  'assets/imghome3.jpg',
                  100,
                  0,
                  MediaQuery.of(context).size.width * 0.27,
                  MediaQuery.of(context).size.height * 0.85),
              SizedBox(
                width: 15,
              ),
            ],
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
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 500,
                    child: SelectableText(
                      'Ipsum enim dolor reprehenderit culpa occaecat non deserunt reprehenderit sunt.Pariatur eiusmod proident sint tempor magna mollit dolore aliqua consequat do veniam.Velit ipsum culpa esse velit labore minim irure labore non.',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageMobil() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _cuadroImgen1(
                  'assets/img3.jpg',
                  100,
                  0,
                  MediaQuery.of(context).size.width * 0.27,
                  MediaQuery.of(context).size.height * 0.6),
              SizedBox(
                width: 15,
              ),
              _cuadroImgen2(
                  'assets/imghome2.jpg',
                  0,
                  100,
                  MediaQuery.of(context).size.width * 0.27,
                  MediaQuery.of(context).size.height * 0.6),
              SizedBox(
                width: 15,
              ),
              _cuadroImgen3(
                  'assets/imghome3.jpg',
                  100,
                  0,
                  MediaQuery.of(context).size.width * 0.27,
                  MediaQuery.of(context).size.height * 0.6),
              SizedBox(
                width: 15,
              ),
            ],
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
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 500,
                    child: SelectableText(
                      'Ipsum enim dolor reprehenderit culpa occaecat non deserunt reprehenderit sunt.Pariatur eiusmod proident sint tempor magna mollit dolore aliqua consequat do veniam.Velit ipsum culpa esse velit labore minim irure labore non.',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cuadroImgen1(
      String path, double top, double bottom, double width, double height) {
    return AnimatedOpacity(
        // Si el Widget debe ser visible, anime a 1.0 (completamente visible). Si
        // el Widget debe estar oculto, anime a 0.0 (invisible).
        opacity: _visible1 ? 0.0 : 1,
        duration: Duration(seconds: 2),
        // El cuadro debe ser el hijo de AnimatedOpacity
        child: Container(
            padding: EdgeInsets.only(top: top, bottom: bottom),
            width: width,
            height: height,
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            )));
  }

  Widget _cuadroImgen2(
      String path, double top, double bottom, double width, double height) {
    return AnimatedOpacity(
        // Si el Widget debe ser visible, anime a 1.0 (completamente visible). Si
        // el Widget debe estar oculto, anime a 0.0 (invisible).
        opacity: _visible2 ? 0.0 : 1,
        duration: Duration(seconds: 2),
        // El cuadro debe ser el hijo de AnimatedOpacity
        child: Container(
            padding: EdgeInsets.only(top: top, bottom: bottom),
            width: width,
            height: height,
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            )));
  }

  Widget _cuadroImgen3(
      String path, double top, double bottom, double width, double height) {
    return AnimatedOpacity(
        // Si el Widget debe ser visible, anime a 1.0 (completamente visible). Si
        // el Widget debe estar oculto, anime a 0.0 (invisible).
        opacity: _visible3 ? 0.0 : 1,
        duration: Duration(seconds: 2),
        // El cuadro debe ser el hijo de AnimatedOpacity
        child: Container(
            padding: EdgeInsets.only(top: top, bottom: bottom),
            width: width,
            height: height,
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            )));
  }

  Widget _cuadroImgen4(
      String path, double top, double bottom, double width, double height) {
    return AnimatedOpacity(
        // Si el Widget debe ser visible, anime a 1.0 (completamente visible). Si
        // el Widget debe estar oculto, anime a 0.0 (invisible).
        opacity: _visible4 ? 0.0 : 1,
        duration: Duration(seconds: 2),
        // El cuadro debe ser el hijo de AnimatedOpacity
        child: Container(
            padding: EdgeInsets.only(top: top, bottom: bottom),
            width: width,
            height: height,
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            )));
  }
}

class HomePage extends StatelessWidget {
  double alto;
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('mypost').snapshots();

    if (MediaQuery.of(context).size.height >= 920) {
      alto = MediaQuery.of(context).size.height * 0.4;
    } else {
      alto = 430;
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 230, 232, 1),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
         
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Map<String, dynamic>> list = [];
            
           snapshot.data.docs.map((QueryDocumentSnapshot document){
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              list.add(data);
           }).toList();
           print(list[1]['nombre']);
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/wachiwit-home-concerts-king-street-coffee.jpg',
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.03,
                          top: MediaQuery.of(context).size.height * 0.2),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(10)),
                          width: 600,
                          child: Text(
                            'Magna ullamco aliquip culpa consectetur laborum reprehenderit do adipisicing officia culpa.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.center,
                          )),
                    )
                  ],
                ),
                Text(
                  'Perfiles recientes: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return homeWeb(context, list[index]);
                    },
                    itemCount: 4,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    pagination:
                        new SwiperPagination(margin: new EdgeInsets.all(5.0)),
                  ),
                )

                /*Container(
                  color: Color.fromRGBO(228, 230, 232, 1),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.docs
                        .map((QueryDocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;

                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: layaout(context, homeWeb(context, data),
                            homeWeb2(context, data), homeMobil(context, data)),
                      );
                    }).toList(),
                  ),
                ),*/
              ],
            ),
          );
        },
      ),
    );
  }

  homeWeb(context, data) {
    return Container(
      width: 800,
      height: alto,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3 + 10,
                  left: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
                        radius: 70),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(data["nombre"]),
                      subtitle: Text(data["subtitulo"]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Center(child: Text('facebook'))),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  color: azulOscuro(), borderRadius: BorderRadius.circular(10)),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
                    child: Container(
                        height: 200, child: imagePortada(data['portada'])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Informacion General",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Container(
                      height: 60,
                      child: Text(
                        data["general"],
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                  //Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: ElevatedButton(
                      child: Center(
                        child: Text('Ver perfil'),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),

          //  Text(data['nombre']),
        ],
      ),
    );
  }

  homeWeb2(context, data) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: alto,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.6 + 10,
                  left: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
                        radius: 70),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(data["nombre"]),
                      subtitle: Text(data["subtitulo"]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Center(child: Text('facebook'))),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                  color: azulOscuro(), borderRadius: BorderRadius.circular(10)),
              child: ListView(
                children: [
                  imagePortada(data['portada']),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      "Informacion General",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Text(
                      data["general"],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  //Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: ElevatedButton(
                      child: Center(
                        child: Text('Ver perfil'),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),

          //  Text(data['nombre']),
        ],
      ),
    );
  }

  homeMobil(context, data) {
    return Container(
      width: 800,
      height: alto,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3 + 10,
                  left: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
                        radius: 70),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(data["nombre"]),
                      subtitle: Text(data["subtitulo"]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Center(child: Text('facebook'))),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  color: azulOscuro(), borderRadius: BorderRadius.circular(10)),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      "Informacion General",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Text(
                      data["general"],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  //Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: ElevatedButton(
                      child: Center(
                        child: Text('Ver perfil'),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),

          //  Text(data['nombre']),
        ],
      ),
    );
  }
}
