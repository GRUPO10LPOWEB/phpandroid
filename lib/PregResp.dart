import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phpandroid/principal_page.dart';
class ListarPR extends StatefulWidget{
  String id;
  ListarPR(this.id);
  @override
  _ListarPrState createState() => _ListarPrState();
}

class _ListarPrState extends State<ListarPR>{
  List list;
  Future getPc() async{
    var url='http://192.168.1.36/PROYECTO_FLUTTER_LOGIN/CONTROLADOR/InformacionControlador.php';
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
        title: Text('Preguntas Respuestas'),

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
                          new Text(list[index]['pregunta']),
                          new Text(list[index]['respuesta']),
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