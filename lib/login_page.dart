
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phpandroid/principal_page.dart';


class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State <LoginPage>{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  TextEditingController usuario = new TextEditingController();
  TextEditingController clave = new TextEditingController();

  String nameUser;
  String nameclave;

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child:Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Column(
              children: [Text('Iniciar Sesion\n'),_usuario(),_clave(),_btnEntrar()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usuario(){
    return TextFormField(
      controller: usuario,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Ingrese el usuario',
      ),
      validator: (String argumento1){
        if(argumento1.length<1)
          return 'Ingrese su nombre de usuario';
        else
          return null;
      },
      onSaved: (String val){
        nameUser = val;
      }
    );
  }

  Widget _clave(){
    return TextFormField(
      controller: clave,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Ingerse la contraseña',
      ),

      obscureText: true,
        validator: (String argumento1){
      if(argumento1.length<1)
        return 'Ingrese su contraseña';
      else
        return null;
    },
        onSaved: (String val){
          nameclave = val;
        }
    );
  }

  Widget _btnEntrar(){
    return RaisedButton(
      onPressed: (){
        _validar();
      },
      child: Text('Entrar'),
    );
  }

  void _validar() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _login();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Future _login() async{
    final url='http://192.168.1.36/PROYECTO_FLUTTER_LOGIN/CONTROLADOR/LoginControlador.php';
    final response = await http.post(url, body: {
      "usuario": usuario.text,
      "clave": clave.text,

    });
    Map<String, dynamic> map = jsonDecode(response.body.toString());
    String estado = map['acceso'][1]["estado"];
    String id = map['acceso'][0]["id"];
    String user = map['acceso'][1]["usuario"];

    print("Estado= " + estado);
    print("Id= " + id);
    print("Usuario= " + user);
if(estado=='1'){
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => PrincipalPage(user)));
  }else{

}

  }

}