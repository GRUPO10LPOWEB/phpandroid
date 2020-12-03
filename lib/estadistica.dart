import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phpandroid/principal_page.dart';
class ListarESTA extends StatefulWidget{
  String id;
  ListarESTA(this.id);
  @override
  _ListarEstaState createState() => _ListarEstaState();
}

class _ListarEstaState extends State<ListarESTA>{
  List list;
  Future getPc() async{
    var url='http://192.168.1.36/PROYECTO_FLUTTER_LOGIN/CONTROLADOR/EstadisticaControlador.php';
    final response = await http.get(url, headers: {
      "Accept": "aplication/json",
    });
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) => PrincipalPage(widget.id)));
              })
        ],
        title: Text('MAPA'),

      ),
      body: Container(

        child: FutureBuilder(

          future: getPc(),
          builder:(context,snapshot) {
            if(snapshot.hasData){
              print(snapshot.hasError);
            }
            return snapshot.hasData
                ? Scrollbar(
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index){
                      list=snapshot.data;

                      return  Column(

                        children: <Widget>[

                          new Text('-------------------------------------------------------------------------------------------------------------------'),
                          new Text('Estadisticas Actuales'),
                          new Text(''),
                          new Text('Personas Muestradas'),
                          new Text(list[index]['personas_muestradas']),
                          new Text(''),
                          new Text('Infectados'),
                          new Text(list[index]['infectados']),
                          new Text(''),
                          new Text('Fallecidos'),
                          new Text(list[index]['fallecidos']),
                          new Text(''),
                          new Text('Recuperados'),
                          new Text(list[index]['recuperados']),
                          new Text(''),
                          new Text('Resultados Negativos'),
                          new Text(list[index]['ResultadosNegativos']),
                          new Text(''),
                          new Text('Hospitalizados'),
                          new Text(list[index]['hospitalizados']),
                          new Text('-------------------------------------------------------------------------------------------------------------------'),


                        ],
                      );
                    }))
                :Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

}