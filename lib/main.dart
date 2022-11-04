import 'package:flutter/material.dart';
import 'package:newsapp/view/detailScreen.dart';
import 'package:newsapp/provider/homeProvider.dart';
import 'package:newsapp/view/homeScreen.dart';
import 'package:newsapp/view/navigationScreen.dart';
import 'package:newsapp/view/webview.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => homeProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => navigationScreen(),
          '/home':(context) => homeScreen(),
          '/detail':(context) => detailScreen(),
          '/web':(context) => webviewScreen(),
        },
      ),
    ),
  );
}