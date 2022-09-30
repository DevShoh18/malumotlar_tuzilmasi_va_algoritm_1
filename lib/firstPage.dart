import 'dart:async';

import 'package:flutter/material.dart';
import 'package:malumotlar_tuzilmasi_va_algoritm_1/secondPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  showScreen() async {
    return Timer(Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
        return SecondPage();
      }), (route) => false);
    });
  }

  @override
  void initState(){
    super.initState();
    showScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pink,
              Colors.red,
              Colors.blue,
            ]
          )
        ),
        child: Image(image: AssetImage('images/img.png'), width: 200, height: 200,),
      ),
    );
  }
}
