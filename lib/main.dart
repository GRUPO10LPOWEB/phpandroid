import 'package:flutter/material.dart';
import 'package:phpandroid/login_page.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
          routes:{
            'login': (BuildContext context) => LoginPage(),
          },
    );
  }
}