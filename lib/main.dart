import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/bloc/provider.dart';
import 'package:straussweb/src/routes/rutas.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Strauss',
        initialRoute: 'navegacion',
        routes: getRoutes(),
      ),
    );
  }
}
//Culpa voluptate nisi enim sint esse nostrud mollit ullamco aliquip officia exercitation. Lorem minim esse labore laboris ullamco fugiat dolore enim excepteur. Incididunt cupidatat ipsum minim sint nulla et enim.