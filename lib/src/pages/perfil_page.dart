import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/bloc/provider.dart';
import 'package:straussweb/src/utils/colors_utils.dart';

class PerfilPage extends StatelessWidget {
  final String documentId;
  final String nombre;
  PerfilPage(this.documentId, this.nombre);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
   bloc.changeImageNetwork('1');
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      content: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width * 1,
        child: Row(
          children: [
            Container(width: 200, child: _informationLaterales(context, bloc)),
            _informacionDePerfil(bloc)
          ],
        ),
      ),
      // actions: <Widget>[_floatingButton(context)],
    );
  }


  Widget _informationLaterales(BuildContext context, bloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Crear perfil',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text('Nombre: $nombre'),
        SizedBox(
          height: 10,
        ),
        Text('Titulo: Perfil personal'),
        SizedBox(
          height: 60,
        ),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            child: Container(
              width: 100,
              child: Center(
                child: Text('Cancelar'),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            child: Container(
              width: 100,
              child: Center(
                child: Text('Agregar'),
              ),
            ),
            onPressed: () async {
                final bloc2 = Provider.of(context);
           
          
          DocumentReference mypost =  FirebaseFirestore.instance.collection('mypost').doc(documentId);

          mypost.set(
            { 'nombre' :  '$nombre',
              'portada':  '${bloc2.imageNetwork}',
              'subtitulo':'${ bloc2.subTitle}',
              'telefono': '${bloc2.telefono}',
              'facebook': '${bloc2.facebook}',
              'general': '${bloc2.general}',
              'personal': '${bloc2.personal}',
              'participaciones': '${bloc2.participaciones}',
              'habilidad':'${bloc2.habilidad}',
              'especialidad': '${bloc2.especilidad}',
              'instrumento':'${bloc2.instrumento}',
              'grupos':'${bloc2.grupos}'
            },
          );

          Navigator.of(context).pop();
        }
          ),
        ),
      ],
    );
  }

  Widget _informacionDePerfil(bloc) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 5),
            spreadRadius: 10.0)
      ]),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                  width: double.infinity,
                  height: 550,
                  child: _imagePortada(bloc)),
              Container(
                  width: double.infinity,
                  height: 550,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: MyStatefulWidget(),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 400, left: 20, right: 20),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: FadeInImage(
                          image: _imageNetwork(),
                          placeholder: AssetImage('assets/loading.gif'),
                          fadeInDuration: Duration(milliseconds: 200),
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 140),
                      child: Container(
                        width: 200,
                        child: ListTile(
                            title: SelectableText(
                              '$nombre',
                            ),
                            subtitle: _subtitulo(bloc)),
                      ),
                    ),
                    //
                    // ),
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.only(top: 160),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Informacion de contacto:'),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Telefono:   '),
                              _campoInformacionTelefono(bloc),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Facebook: '),
                              _campoInformacionFacebook(bloc),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Informacion General ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          _campoDescripcionCarreraMusicall(bloc),
          SizedBox(
            height: 20,
          ),
          Text(
            'Informacion Personal',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 110),
            child: Row(
              children: [
                Expanded(child: _campoInformacionPersonal(bloc)),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Icon(
                    Icons.person_pin,
                    color: azulOscuro(),
                    size: 120,
                  ),
                )
              ],
            ),
          ),
          Text(
            'Ultimas participaciones',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 110),
            child: Row(
              children: [
                Expanded(
                  child: _campoUltimasparticipaciones(bloc),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Icon(
                    Icons.event_available_sharp,
                    color: azulOscuro(),
                    size: 120,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'habilidades, especialidades e instrumentos',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Card(
                  child: Column(
                    children: [
                      Text(
                        'Habilidades',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _campoHabilidades(bloc),
                      SizedBox(
                        height: 60,
                      ),
                      Icon(
                        Icons.music_note,
                        color: azulOscuro(),
                        size: 60,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Column(
                    children: [
                      Text(
                        'Especialidades',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _campoEspecialidades(bloc),
                      SizedBox(
                        height: 60,
                      ),
                      Icon(
                        Icons.library_music_rounded,
                        color: azulOscuro(),
                        size: 60,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Column(
                    children: [
                      Text(
                        'Instrumentos',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _campoInstrumentos(bloc),
                      SizedBox(
                        height: 60,
                      ),
                      Icon(
                        Icons.queue_music_rounded,
                        color: azulOscuro(),
                        size: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Grupos',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: _campoGrupos(bloc),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Icon(
                  Icons.group,
                  color: azulOscuro(),
                  size: 120,
                ),
              ),
            ],
          ),
        ],
      )),
    ));
  }

  Widget _imagePortada(bloc) {

    return StreamBuilder(
        stream: bloc.imagePortadaStream,
        builder: (context, snapshot) {
          switch (bloc.imageNetwork) {
            case '1':
              return FadeInImage(
                image: NetworkImage(
                    'https://static2.abc.es/media/cultura/2019/09/26/beatlesss-kY2D--620x349@abc.jpg'),
                placeholder: AssetImage('assets/loading.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                fit: BoxFit.fitWidth,
              );
              break;
            case '2':
              return FadeInImage(
                image: NetworkImage(
                    'https://www.anahuac.mx/veracruz/sites/default/files/2019-11/concierto-orquesta-filarmonica-xalapa_fbtw.jpg'),
                placeholder: AssetImage('assets/loading.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                fit: BoxFit.fitWidth,
              );
              break;
            case '3':
              return FadeInImage(
                image: NetworkImage(
                    'https://ep00.epimg.net/cultura/imagenes/2016/01/04/actualidad/1451873486_818047_1451874168_noticia_normal.jpg'),
                placeholder: AssetImage('assets/loading.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                fit: BoxFit.fitWidth,
              );
              break;
            case '4':
              return FadeInImage(
                image: NetworkImage(
                    'https://www.musicalesyeventosanha.com/blog/wp-content/uploads/2014/01/Tenor-violinista-y-organista-en-boda-religiosa.jpg'),
                placeholder: AssetImage('assets/loading.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                fit: BoxFit.fitWidth,
              );

            default:
              return FadeInImage(
                image: NetworkImage(
                    'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
                placeholder: AssetImage('assets/loading.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                fit: BoxFit.fitWidth,
              );
              
          }
        });
  }

  Widget _subtitulo(bloc) {
    return StreamBuilder(
      stream: bloc.subtitleStream,
      builder: (context, snapshot) {
        return Container(
          width: 220,
          height: 120,
          child: TextField(
            maxLines: 5,
            minLines: 2,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              //contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
              hintText: 'subtitulo relevante para busquedas.',
              counter: Text(''),
            ),
            onChanged: bloc.changeSubtitle 
          ),
        );
      }
    );
  }

  _imageNetwork() {
    return NetworkImage(
        'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg');
  }
}

Widget _campoInformacionTelefono(bloc) {
  return StreamBuilder(
    stream: bloc.telefonoStream,
    builder: (context, snapshot) {
      return Container(
        width: 190,
        height: 100,
        child: TextField(
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            //contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
            hintText: 'Num. telefonico.',
            counter: Text(''),
          ),
          onChanged: bloc.changeTelefono
        ),
      );
    }
  );
}

Widget _campoInformacionFacebook(bloc) {
  return StreamBuilder(
    stream: bloc.facebookStream,
    builder: (context, snapshot) {
      return Container(
        width: 190,
        height: 100,
        child: TextField(
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            //contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
           
            hintText: 'Link de facebook.',
            counter: Text(''),
          ),
          onChanged:bloc.changeFacebook
        ),
      );
    }
  );
}

Widget _campoDescripcionCarreraMusicall(bloc) {
  return StreamBuilder(
    stream: bloc.generalStream,
    builder: (context, snapshot) {
      return Container(
        height: 200,
        child: TextField(
          maxLines: 7,
          minLines: 7,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            //contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
            hintText: 'Una breve descripción de tu carrera musical.',
            counter: Text(''),
          ),
          onChanged: bloc.changeGeneral
        ),
      );
    }
  );
}

Widget _campoInformacionPersonal(bloc) {
  return StreamBuilder(
    stream: bloc.personalStream,
    builder: (context, snapshot) {
      return Container(
        height: 200,
        child: TextField(
          maxLines: 7,
          minLines: 7,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            //contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
              hintText: 'Informacion personal sobre la edad, sexo e informacion relevante sobre ti mismo.',
            counter: Text(''),
          ),
          onChanged: bloc.changePersonal
        ),
      );
    }
  );
}

Widget _campoUltimasparticipaciones(bloc) {
  return StreamBuilder(
    stream: bloc.participacionesStream,
    builder: (context, snapshot) {
      return Container(
        height: 200,
        child: TextField(
          maxLines: 7,
          minLines: 7,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            //contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
            hintText: 'Ultimas eventos a los que has asistido o eventos mas relevantes para ti.',
            counter: Text(''),
          ),
          onChanged: bloc.changeParticipaciones
        ),
      );
    }
  );
}

Widget _campoHabilidades(bloc) {
  return StreamBuilder(
    stream: bloc.habilidadStream,
    builder: (context, snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 200,
        child: TextField(
          maxLines: 7,
          minLines: 7,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            //contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
            hintText: 'Habilidades mas destacadas en el hambito musical',
            counter: Text(''),
          ),
          onChanged: bloc.changeHabilidad
        ),
      );
    }
  );
}

Widget _campoEspecialidades(bloc) {
  return StreamBuilder(
    stream: bloc.especialidadStream,
    builder: (context, snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 200,
        child: TextField(
          maxLines: 7,
          minLines: 7,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            //contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
            hintText: 'Genera o musica en la que te especializas, asi como tu repertorio en general.',
            counter: Text(''),
          ),
          onChanged: bloc.changeEspecilidad
        ),
      );
    }
  );
}

Widget _campoInstrumentos(bloc) {
  return StreamBuilder(
    stream: bloc.instrumentoStream,
    builder: (context, snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 200,
        child: TextField(
          maxLines: 7,
          minLines: 7,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            //contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
            hintText: 'Intrumentos con los que actualmente cuentas y el nivel sobre cada uno de ellos.',
            counter: Text(''),
          ),
          onChanged: bloc.changeInstrumento
          )
      );
    }
  );
}

Widget _campoGrupos(bloc) {
  return StreamBuilder(
    stream: bloc.gruposStream,
    builder: (context, snapshot) {
      return Container(
        height: 200,
        child: TextField(
          maxLines: 7,
          minLines: 7,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            //contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
            hintText: 'Grupos a los que has estado y experiencias con ellos.',
            counter: Text(''),
          ),
          onChanged: bloc.changeGrupos
        ),
      );
    }
  );
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String img = '1';

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    bloc.changeImageNetwork(img);
    return Container(
      width: 90,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: img,
            icon: const Icon(
              Icons.image,
            ),
            iconSize: 24,
            elevation: 16,
            onChanged: (b) {
              setState(() {
                img = b;
                bloc.changeImageNetwork(b);
              });
            },
            items: <String>['1', '2', '3', '4']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
