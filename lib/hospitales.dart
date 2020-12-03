import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phpandroid/principal_page.dart';

import 'mapa.dart';
class ListarHA extends StatefulWidget{
  String id;
  ListarHA(this.id);
  @override
  _ListarHaState createState() => _ListarHaState();
}

class _ListarHaState extends State<ListarHA>{
  List list;

  Future getPc() async{
    var url='http://192.168.1.36/PROYECTO_FLUTTER_LOGIN/CONTROLADOR/HospitalControlador.php';
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
        title: Text('Hospitales Autorizados'),

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
                          new Text(list[index]['id_hospital']),
                          new Text(list[index]['nombrehp']),
                          new Text(list[index]['distrito']),
                          new Text(list[index]['direccion_hp']),
                          new Text(list[index]['telefono_hp']),
                          new Text(list[index]['hora']),
                          new Text(list[index]['diasxatencion']),
                          new Text(list[index]['latitud']),
                          new Text(list[index]['altitud']),
                          _btnMapa(context,double.parse(list[index]['latitud']), double.parse(list[index]['altitud'])),
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

  Widget _btnMapa(BuildContext context,double lat,double alt){
    return RaisedButton(
      onPressed: (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => MapSample(lat,alt,widget.id)));
      },
      child: Text('Mapa'),
    );
  }
}