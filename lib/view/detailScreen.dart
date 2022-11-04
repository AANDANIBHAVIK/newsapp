import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class detailScreen extends StatefulWidget {
  const detailScreen({Key? key}) : super(key: key);

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff363535),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8),
        //     child: Icon(Icons.favorite_border),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8),
        //     child: Icon(Icons.bookmark_outline),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8),
        //     child: Icon(Icons.share),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 300,
                // width: MediaQuery.of(context).size.width*0.9,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                      "${Provider.of<homeProvider>(context, listen: false).datapicker!.urlToImage}",
                  placeholder: (context, _) =>
                      Center(child: Text("ERROR LOADING!")),
                  errorWidget: (context, _, __) =>
                      Center(child: Text("ERROR LOADING!")),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "${Provider.of<homeProvider>(context, listen: false).datapicker!.title}",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Text(
                        "${Provider.of<homeProvider>(context, listen: false).datapicker!.content}",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                // Container(
                //   height: 1,
                //   width: double.infinity,
                //   color: Colors.white,
                // ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/web');
                          },
                          child: Text("click Here...!")),
                      Text(
                        "For More Details....",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
