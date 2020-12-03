import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phpandroid/principal_page.dart';
class PerfilU extends StatefulWidget{
  String id;
  PerfilU(this.id);
  @override
  _PerfiluState createState() => _PerfiluState();
}

class _PerfiluState extends State<PerfilU>{
  List list;

  Future getPc() async{
    String id1=widget.id;
    String _url='http://192.168.1.36/PROYECTO_FLUTTER_LOGIN/CONTROLADOR/PerfilControlador.php';
    final url='$_url/?id=$id1';
    final response = await http.post(url);
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
        title: Text('Perfil'),

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
                            new Text('PERFIL'),
                          new Text('-------------------------------------------------------------------------------------------------------------------'+'\n'),
                          new Text('Usuario: '+list[index]['idUsuario']+'\n'),
                          new Text('Nombre: '+list[index]['nombre']+'\n'),
                          new Text('Apellido P.: '+list[index]['apepaterno']+'\n'),
                          new Text('Apellido M.: '+list[index]['apematerno']+'\n'),
                          new Text('Fecha Nac.: '+list[index]['fechanac']+'\n'),
                          new Text('Distrito: '+list[index]['distrito']+'\n'),
                          new Text('Direccion: '+list[index]['direccion']+'\n'),
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