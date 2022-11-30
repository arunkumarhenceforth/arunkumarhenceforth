import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled2/State%20Provider/app_state.dart';
import 'package:untitled2/post.dart';
import 'package:untitled2/pro_image.dart';
import 'package:untitled2/stackprofile.dart';
import 'package:untitled2/whats_on_mind.dart';
import 'Constant/Api handler.dart';
import 'Constant/constantfile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ScrollController scrollController=ScrollController();
 // int _currentMax=5;
  TextEditingController _controller = TextEditingController();
  initState() {
     handleNext();
  //  _scrollController.addListener(() {
  //    if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
   //     getMoreList();
  //    }
 //   });
    super.initState();
      // Provider.of<AppState>(context).getAlbum();
  }
  // getMoreList(){
  //   AppState provider = Provider.of<AppState>(context, listen: false);
  //   for( int i=_currentMax;i<_currentMax+5;i++){
  //     provider=
  //
  //   }
  //
  // }

  handleNext(){
    scrollController.addListener(() {
    if(scrollController.position.pixels==scrollController.position.maxScrollExtent) {

    };
    });
  }
  @override
  Widget build(BuildContext context) {
    AppState provider = Provider.of<AppState>(context, listen: false);
    return RefreshIndicator(
        onRefresh: () async {
          await provider.getAlbum();
          setState(() {
            provider.album.isEmpty;
          });
        },
        child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back_outlined,
                      color: Colors.black, size: 30),
                  onPressed: () async {
                    await provider.getAlbum();

                    setState(() {
                      _controller.clear();
                      provider.album.isEmpty;

                    });
                  }),
              title: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              actions: [
                Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          provider.getAlbum(searchString: _controller.text);

                          setState(() {
                            provider.album.clear();
                          }
                                 );
                         }
                        )
                        ),
              ]),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 360,
                  width: 430,
                  child: StackProfile(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                ),
                Container(
                  color: Colors.white,
                  height: 110,
                  width: 430,
                  child: Post(),
                ),

                ///-------------------------------------------
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                ),
                FutureBuilder(
                  future: provider.getAlbum(),
                  builder: (context, abc) {
                    if (abc.hasData) {
                      return CircularProgressIndicator();
                    } else if (abc.hasError) {
                      return Text("${abc.error}");
                    }
                    print("data : ${provider.album.length}");
                    return ListView.builder(
                    //   controller: scrollController,
                      itemCount: provider.album.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          Container(
                            color: Colors.white,
                            height: 380,
                            width: double.infinity,
                            child: Column(
                              children: [

                                ///
                                Container(
                                    height: 90,
                                    width: 430,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                          child: CircleAvatar(
                                            // backgroundColor: Colors.green,
                                            radius: 30,
                                            child: ImagePro(),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text('Jerry Luis',
                                              style: const TextStyle(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        PopupMenuButton(
                                          //color: Colors.blue,
                                            onSelected: (t) async {
                                              if (t == 'delete') {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            ' Alert Dialog Box'),
                                                        content: Text(
                                                            'Do you really want to delete?',
                                                            style: TextStyle(
                                                                fontSize: 20)),
                                                        actions: <Widget>[
                                                          TextButton(
                                                              onPressed: () async {
                                                                final response =
                                                                await httpRequest(
                                                                    REQUEST_TYPE
                                                                        .DELETE,
                                                                    ('${baseUrl}post/delete/${provider
                                                                        .album[index]
                                                                        .id
                                                                        .toString()}'),
                                                                    {});
                                                                if (response
                                                                    .statusCode ==
                                                                    200) {
                                                                  print(response
                                                                      .body);
                                                                  setState(() {
                                                                    provider
                                                                        .album
                                                                        .removeAt(
                                                                        index);
                                                                    Navigator
                                                                        .pop(
                                                                        context);
                                                                  });
                                                                }
                                                              },
                                                              child: Text(
                                                                  'Yes')),
                                                          TextButton(
                                                            child: Text(
                                                                'Close'),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context); //close Dialog
                                                            },
                                                          )
                                                        ],
                                                      );
                                                    });
                                              } else {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          WhatsMind(
                                                            id: provider
                                                                .album[index]
                                                                .id,
                                                          )),
                                                );
                                              }
                                            },
                                            iconSize: 32,
                                            elevation: 10,
                                            shape: Border.all(
                                                color: Colors.black),
                                            itemBuilder: (context) =>
                                            [
                                              PopupMenuItem(
                                                child: Text(
                                                  "Update",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                value: 'update',
                                              ),
                                              PopupMenuItem(
                                                child: Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                value: 'delete',
                                              ),
                                            ]),
                                      ],
                                    )),
                                //Profile(),
                                ///
                                Container(
                                  color: HexColor(
                                      provider.album[index].background
                                          .toString()),
                                  height: 270,
                                  width: 430,
                                  padding: EdgeInsets.only(top: 135),
                                  child: Column(
                                    children: [
                                      Text(provider.album[index].id.toString(),
                                          style: TextStyle(
                                              fontSize: 30, color: Colors.red)),
                                      Text(
                                          provider.album[index].post.toString(),
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.blue)),
                                      Text(
                                        provider.album[index].created_at
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                      // Text(album[index].background.toString(),
                                      //     style:TextStyle(fontSize: 20,color: Colors.red)),
                                      Text(
                                        provider.album[index].updated_at
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
