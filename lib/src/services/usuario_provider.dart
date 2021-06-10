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
       print(g.user.uid);
       _createPost(g.user.uid);
      await g.user.updateDisplayName(nombre);
      DocumentReference userRef = FirebaseFirestore.instance.collection('usuarios').doc();

      userRef.set(
        {
          'id': g.user.uid,
          'displayName': nombre,
          'email': email,
          'lastSign': date,
        },
      );
      return {'ok': true};
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return {'ok': false, 'mensaje': e.message};
    }
  }

_createPost(String id) {
    DocumentReference mypost = FirebaseFirestore.instance.collection('mypost').doc(id);
    mypost.set({
      'initpost':'initpost'
    });
    
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
