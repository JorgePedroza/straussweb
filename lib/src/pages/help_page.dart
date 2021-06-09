import 'package:flutter/material.dart';


class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
         print(constraints.maxWidth );

      if (constraints.maxWidth > 1200) {
       
        return _helpWeb();
      }
      if (constraints.maxWidth > 800) {
        return _helpWeb();
      } else {
        return _helpMobil();
      }
    }));
  }

  Widget _helpWeb() {
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
                _card(Colors.blue),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _card(Colors.red),
                ),
                _card(Colors.lightGreenAccent),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _card(Colors.blue),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _card(Colors.red),
                ),
                _card(Colors.lightGreenAccent),
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
              Container(
                width: 200,
                height: 800,
                color: Colors.amberAccent,
              )
            ],
          ),
        ],
      ),
    );
  }

   Widget _helpMobil() {
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
                _card(Colors.blue),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _card(Colors.red),
                ),
                _card(Colors.lightGreenAccent),
              ]),
              SizedBox(
                height: 10,
              ),
             Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                _card(Colors.blue),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _card(Colors.red),
                ),
                _card(Colors.lightGreenAccent),
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
              
              Container(
                width: 200,
                height: 800,
                color: Colors.amberAccent,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _card(Color color) {
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
                    decoration: new BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 30),
                child: Text(
                  'Configuracion de la cuenta',
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
