import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/view/detailScreen.dart';
import 'package:newsapp/provider/homeProvider.dart';
import 'package:newsapp/view/homeScreen.dart';
import 'package:newsapp/view/loginScreen.dart';
import 'package:newsapp/view/navigationScreen.dart';
import 'package:newsapp/view/splaceScreen.dart';
import 'package:newsapp/view/webview.dart';
import 'package:provider/provider.dart';

void main()async

{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(


    MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => homeProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Splace_Screen(),
          '/login': (context) => LoginScreen(),
          '/nav': (context) => navigationScreen(),
          '/home':(context) => homeScreen(),
          '/detail':(context) => detailScreen(),
          '/web':(context) => webviewScreen(),
        },
      ),
    ),
  );
}