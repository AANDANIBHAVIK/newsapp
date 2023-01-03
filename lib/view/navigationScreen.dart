import 'package:flutter/material.dart';
import 'package:newsapp/provider/homeProvider.dart';
import 'package:provider/provider.dart';

import 'homeScreen.dart';

class navigationScreen extends StatefulWidget {
  const navigationScreen({Key? key}) : super(key: key);

  @override
  State<navigationScreen> createState() => _navigationScreenState();
}

class _navigationScreenState extends State<navigationScreen> {

  var Screen = [homeScreen(),Center(child: Text("Video Screen")),Center(child: Text("Setting Screen"))];
  // int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Screen[Provider.of<homeProvider>(context,listen: true).selectIndex],

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey,
            currentIndex: Provider.of<homeProvider>(context).selectIndex,
            onTap: (int index){
              Provider.of<homeProvider>(context,listen: false).selectindex(index);
            },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle),
              label: "Video",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_sharp),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
