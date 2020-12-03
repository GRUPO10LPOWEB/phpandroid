import 'package:flutter/material.dart';
import 'package:phpandroid/login_page.dart';
import 'package:phpandroid/perfil.dart';
import 'package:phpandroid/puntocovid.dart';

import 'PregResp.dart';
import 'estadistica.dart';
import 'grafico.dart';
import 'hospitales.dart';
class PrincipalPage extends StatefulWidget {
  String id;

  PrincipalPage(this.id);

  @override
  _PriState createState() => _PriState();
}
class _PriState extends State<PrincipalPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
      ),
      body: Container(

        child: Column(
          children: [_btnPerfil(context,widget.id),_btnPc(context),_btnHa(context),_btnPre(context),_btnEsta(context),_btngraf(context),_btnSalir(context)],
        ),

      ),
    );
  }
  Widget _btnSalir(BuildContext context){
    return RaisedButton(
      onPressed: (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      },
      child: Text('Cerrar Sesion'),
    );
  }
  Widget _btnPc(BuildContext context){
    return RaisedButton(
      onPressed: (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => ListarPC(widget.id)));
      },
      child: Text('Puntos Covid'),
    );
  }
  Widget _btnHa(BuildContext context){
    return RaisedButton(
      onPressed: (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => ListarHA(widget.id)));
      },
      child: Text('Hopitales autorizados'),
    );
  }
  Widget _btnPre(BuildContext context){
    return RaisedButton(
      onPressed: (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => ListarPR(widget.id)));
      },
      child: Text('Preguntas y Respuestas'),
    );
  }
  Widget _btnEsta(BuildContext context){
    return RaisedButton(
      onPressed: (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => ListarESTA(widget.id)));
      },
      child: Text('Estadistica'),
    );
  }

  Widget _btngraf(BuildContext context){
    return RaisedButton(
      onPressed: (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => graf(null)));
      },
      child: Text('Grafico'),
    );
  }

  Widget _btnPerfil(BuildContext context,String id){
    return RaisedButton(
      onPressed: (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => PerfilU(id)));
      },
      child: Text('Perfil'),
    );
  }

}