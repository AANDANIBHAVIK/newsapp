import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/firebase.dart';


class Splace_Screen extends StatefulWidget {
  const Splace_Screen({Key? key}) : super(key: key);

  @override
  State<Splace_Screen> createState() => _Splace_ScreenState();
}

class _Splace_ScreenState extends State<Splace_Screen> {
  bool msg = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    msg = checkUser();
  }
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3),()=>msg?Navigator.pushReplacementNamed(context,'/nav'):Navigator.pushReplacementNamed(context, '/login'));

    return SafeArea(child: Scaffold(body:Center(
      child: FlutterLogo(
        size: 150,
      ),
    ),),);
  }
}
