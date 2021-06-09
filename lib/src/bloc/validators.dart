import 'dart:async';

class Validators {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (email.length == 0) {
      sink.addError('Campo vacio');
    } else if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no es correcto');
    }
  });

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length == 0) {
      sink.addError('Campo vacio');
    } else if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Contraseña no valida, minimo 6 caracteres');
    }
  });

  final validarName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length == 0) {
      sink.addError('Campo vacio');
    } else {
      sink.add(name);
    }
  });

  final validarDate =
      StreamTransformer<String, String>.fromHandlers(handleData: (date, sink) {
    if (date.length == 0) {
      sink.addError('Campo vacio');
    } else {
      sink.add(date);
    }
  });
}
