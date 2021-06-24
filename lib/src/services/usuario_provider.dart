import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsuarioProvider {
  Future login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return {'ok': true};
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return {'ok': false, 'mensaje': e.message};
    }
  }

  Future register( String nombre, String email, String password, String date) async {
   
  
    try {
     final g = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
       
      // _createPost(g.user.uid);
      await g.user.updateDisplayName(nombre);
      await g.user.updatePhotoURL('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg');
      DocumentReference userRef = FirebaseFirestore.instance.collection('usuarios').doc();

      userRef.set(
        {
          'id': g.user.uid,
          'displayName': nombre,
          'email': email,
          'lastSign': date,
          'url' : 'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'
        },
      );
      return {'ok': true};
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return {'ok': false, 'mensaje': e.message};
    }
  }


  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
