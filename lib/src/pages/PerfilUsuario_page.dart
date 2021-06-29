import 'package:flutter/material.dart';
import 'package:straussweb/models/models.dart';
import 'package:straussweb/src/utils/colors_utils.dart';
import 'package:straussweb/src/widgets/widgets.dart';


class PerfilUsuarioPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    ModelUsuario usu = ModelUsuario();
    return Scaffold(body: _myPost(usu),);
  }
  Widget _myPost(ModelUsuario usu) {
    return Card(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 550,
                        child: imagePortada(usu.getPortada)),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 400, left: 20, right: 20),
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
                                image: NetworkImage('${usu.getUrl}'),
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
                                    '$usu.getNombre',
                                  ),
                                  subtitle:
                                      SelectableText('${usu.getSubtitulo}')),
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
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Telefono: '),
                                    SelectableText('${usu.getTelefono}')
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(59, 89, 152, 1))),
                                  child: Container(
                                      width: 120,
                                      child: Center(
                                          child: Text(
                                        'Facebook',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                  onPressed: () {
                                    launchURL("https://www.facebook.com/${usu.getFacebook}");
                                  },
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
                  'Una breve descripción de su carrera musical. ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                SelectableText('${usu.getGeneral}'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'InformacionPersonal',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 110),
                  child: Row(
                    children: [
                      Expanded(child: SelectableText('${usu.getPersonal}')),
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
                        child: SelectableText('${usu.getParticipaciones}'),
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
                        child: Container(
                          width: 400,
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
                              SelectableText('${usu.getHabilidad}'),
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
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          width: 400,
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
                              SelectableText('${usu.getEspecialidad}'),
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
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          width: 400,
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
                              SelectableText('${usu.getInstrumento}'),
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Grupos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SelectableText('${usu.getGrupos}'),
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
            ),
          )),
    );
  }
}