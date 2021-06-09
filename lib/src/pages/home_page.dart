import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  _contenedorProyectoos());
  }

  Container _contenedorProyectoos() {
    return Container(
    
      height: 800,
      color: Color.fromRGBO(203, 198, 195, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Se parte de lo proximos \nproyecto y futuros exitos músicales.',
            style: TextStyle(fontSize: 60),
          ),
          //Image.asset(
          //  'assets/tumblr_mszptvq1vl1qj313eo1_500.gif',
         // )
        ],
      ),
    );
  }

  Widget _fotoBienvenida() {
    return Container(
        width: 600,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(360),
            child: Image.asset('assets/img3.jpg')));
  }

  Widget _crearBienvenida(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '¡Te damos la bienvenida \na tu comunidad\nprofesional!',
          style: TextStyle(fontSize: 60),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          '✔ La mejor manera de anunciarte',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '✔ La mejor forma de encontrar lo que buscas',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '✔ Todo al alcance de tu mano',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
