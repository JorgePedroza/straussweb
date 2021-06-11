import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/pages/navegacion_page.dart';

class StatusUsuario extends StatelessWidget {
   final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
            return NavegacionPage();
          }
          return NavegacionPageOff();
      }
    );
  }
}