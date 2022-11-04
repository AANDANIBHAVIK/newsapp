import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/newsModel.dart';
import 'package:newsapp/provider/homeProvider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';


class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  homeProvider? providerfalse;
  homeProvider? providertrue;

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<homeProvider>(context, listen: false);
    providertrue = Provider.of<homeProvider>(context, listen: true);
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.grey,
              title: Text("News App"),
              actions: [
                 IconButton(
                   onPressed: () async{
                 if(await Permission.camera.isDenied)
                   {
                    Permission.camera.request();
                   }
                   },
                   icon: Icon(Icons.menu),
                 ),
              ],
              // centerTitle: true,
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text("For You"),
                  ),
                  Tab(
                    child: Text("Share Market"),
                  ),
                  Tab(
                    child: Text("Cricket"),
                  ),
                  Tab(
                    child: Text("Mobile"),
                  ),
                  Tab(
                    child: Text("Entertainment"),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                homeScreenview(),
                homeScreenview(),
                homeScreenview(),
                homeScreenview(),
                homeScreenview()
              ],
            )),
      ),
    );
  }

  Widget homeScreenview() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Btn("in"),
              Btn("au"),
              Btn("US"),
              Btn("ca"),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<dynamic>(
            future: Provider.of<homeProvider>(context, listen: false).newsapi(
              "${Provider.of<homeProvider>(context,listen: true).country}"
            ),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                NewsModel data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.articles!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        providerfalse!.datapicker = data.articles![index];
                        Navigator.pushNamed(context, '/detail');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: Container(
                          height: 250,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.9,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  height: 150,
                                  width: double.infinity,
                                  child: Image.network(
                                      "${data.articles![index].urlToImage}",
                                      fit: BoxFit.cover),
                                ),

                                //  child: CachedNetworkImage(
                                //   imageUrl: "${data.articles![index].urlToImage}",
                                //   height: 150,
                                //   width: double.infinity,
                                //   fit: BoxFit.cover,
                                //   placeholder: (context,_) => Center(child: Text("Error Loading!")),
                                //   errorWidget: (context,_,__) => Center(child: Text("Error Loading!")),
                                // ),
                              ),
                              Text(
                                "${data.articles![index].title}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white54,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 150,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 16,
                            color: Colors.white,
                            width: double.infinity,
                          ),
                        )
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget Btn(String data) {
    return InkWell(
      onTap: () {
        Provider.of<homeProvider>(context,listen: false).ChangeCountry(data);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 40,
        width: 80,
        color: Colors.grey,
        child: Center(child: Text("$data")),
      ),
    );
  }
}
