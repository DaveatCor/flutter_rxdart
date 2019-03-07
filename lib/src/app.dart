import 'package:flutter/material.dart';
import './login_screen/login_screen.dart';
import './provider/provider.dart';

class App extends StatelessWidget{
  Widget build(context){
    // return MaterialApp(
    //     home: Scaffold(
    //       body: LoginScreen(),
    //     ),
    // );
    return Provider(
      child: MaterialApp(
        title: 'Login block!!!',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}