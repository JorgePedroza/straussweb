import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:straussweb/src/bloc/validators.dart';
class LoginBloc with Validators {


  final _nameController = BehaviorSubject<String>();
  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _dateController = BehaviorSubject<String>();
  final _pageController = BehaviorSubject<String>();

  //Controller formulario de perfil
   final _imagePortadaController = BehaviorSubject<String>();
   final _subtitleController = BehaviorSubject<String>();
   final _telefonoController = BehaviorSubject<String>();
   final _facebookController = BehaviorSubject<String>();
   final _generalController = BehaviorSubject<String>();
   final _personalController = BehaviorSubject<String>();
   final _participacionesController = BehaviorSubject<String>();
   final _habilidadController = BehaviorSubject<String>();
   final _especialidadController = BehaviorSubject<String>();
   final _instrumentoController = BehaviorSubject<String>();  
   final _gruposController = BehaviorSubject<String>();  
   
   // Recuperar los datos del Stream
  Stream<String> get nameStream     => _nameController.stream.transform( validarName );
  Stream<String> get emailStream    => _emailController.stream.transform( validarEmail );
  Stream<String> get passwordStream => _passwordController.stream.transform( validarPassword );
  Stream<String> get dateStream => _dateController.transform( validarDate );
  Stream<String> get pageStream => _pageController.stream;
  
  //recuperar datos del formulario 
  Stream<String> get imagePortadaStream     => _imagePortadaController.stream;
  Stream<String> get subtitleStream     => _subtitleController.stream;
  Stream<String> get telefonoStream     => _telefonoController.stream;
  Stream<String> get facebookStream     => _facebookController.stream;
  Stream<String> get generalStream     => _generalController.stream;
  Stream<String> get personalStream     => _personalController.stream;
  Stream<String> get participacionesStream     => _participacionesController.stream;
  Stream<String> get habilidadStream     => _habilidadController.stream;
  Stream<String> get especialidadStream     => _especialidadController.stream;
  Stream<String> get instrumentoStream     => _instrumentoController.stream;
  Stream<String> get gruposStream     => _gruposController.stream;

  

//=========================================FormValidators=========================================================================================
  Stream<bool> get formValidStream => Rx.combineLatest4(nameStream ,emailStream, passwordStream, dateStream, (n , e, p, d) => true );
  Stream<bool> get formValidStreamLogin => Rx.combineLatest2(emailStream, passwordStream, (e, p) => true );

  // Stream<bool> get formValidStreamFormulario => Rx.combineLatest9(emailStream, passwordStream, (e, p) => true );
//=========================================FormValidators=========================================================================================

  // Insertar valores al Stream
  Function(String) get changeName    => _nameController.sink.add;
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeDate => _dateController.sink.add;
  Function(String) get changePage => _pageController.sink.add;

 //Insertar datos del formulario 
 Function(String) get changeImageNetwork    => _imagePortadaController.sink.add;
 Function(String) get changeSubtitle   => _subtitleController.sink.add;
 Function(String) get changeTelefono  => _telefonoController.sink.add;
 Function(String) get changeFacebook  => _facebookController.sink.add;
 Function(String) get changeGeneral  => _generalController.sink.add;
 Function(String) get changePersonal  => _personalController.sink.add;
  Function(String) get changeParticipaciones  => _participacionesController.sink.add;
  Function(String) get changeHabilidad  => _habilidadController.sink.add;
  Function(String) get changeEspecilidad  => _especialidadController.sink.add;
  Function(String) get changeInstrumento  => _instrumentoController.sink.add;
  Function(String) get changeGrupos => _gruposController.sink.add;

  // Obtener el último valor ingresado a los streams
   String get name    => _nameController.value;
  String get email    => _emailController.value;
  String get password => _passwordController.value;
  String get date => _dateController.value;
  String get page => _pageController.value;

  //Obtener datos del formulario 
  String get imageNetwork    => _imagePortadaController.value;
  String get subTitle   => _subtitleController.value;
  String get telefono   => _telefonoController.value;
  String get facebook  =>  _facebookController.value;
  String get general  => _generalController.value;
  String get personal  =>  _personalController.value;
  String get participaciones  =>  _participacionesController.value;
  String get habilidad =>  _habilidadController.value;
  String get especilidad  =>  _especialidadController.value;
  String get instrumento  =>  _instrumentoController.value;
  String get grupos =>  _gruposController.value;


  dispose() {
      _gruposController?.close();
      _instrumentoController?.close();
      _especialidadController?.close();
      _habilidadController?.close();
    _participacionesController?.close();
    _generalController?.close();
    _personalController?.close();
    _facebookController?.close();
    _telefonoController?.close();
    _subtitleController?.close();
    _imagePortadaController?.close();
     _pageController?.close();
    _nameController?.close();
    _emailController?.close();
    _passwordController?.close();
    _dateController?.close();
  }

}

