
class ModelUsuario{

 static ModelUsuario _singleton = ModelUsuario._internal();

  factory ModelUsuario() {
    return _singleton;
  }

  ModelUsuario._internal();

  String _especialidad;
  String _facebook;
  String _general;
  String _grupos;
  String _habilidad;
   String _instrumento;
  String _nombre;
  String _participaciones;
  String _personal;
  String _portada;
  String _subtitulo;
  String _telefono;
  String _url;


 void setMap(Map<String, dynamic> data) {
    this._especialidad = data["especialidad"];
    this._facebook = data["facebook"];
    this._general = data["general"];
    this._grupos = data["grupos"];
    this._habilidad= data["habilidad"];
     this._instrumento= data["instrumento"];
    this._nombre = data["nombre"];
    this._participaciones = data["participaciones"];
    this._personal = data["personal"];
    this._portada= data["portada"];
     this._subtitulo = data["subtitulo"];
    this._telefono= data["telefono"];
    this._url = data["url"];
  }
  
  String get getEspecialidad=> _especialidad;
  String get getFacebook => _facebook;
  String get getGeneral => _general;
  String get getGrupos => _grupos;
  String get getHabilidad=> _habilidad;
   String get getInstrumento => _instrumento;
  String get getNombre=> _nombre;
  String get getParticipaciones => _participaciones; 
  String get getPersonal => _personal;
  String get getPortada => _portada;
  String get getSubtitulo =>  _subtitulo;
  String get getTelefono => _telefono;
  String get getUrl=> _url;


}