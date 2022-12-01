

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:selectable_container/selectable_container.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/pro_image.dart';
import 'package:untitled2/profile.dart';

import 'Constant/Api handler.dart';
import 'Constant/constantfile.dart';


class WhatsMind extends StatefulWidget {
  final int? id;
  const WhatsMind({Key? key, this.id,}) : super(key: key);

  @override
  State<WhatsMind> createState() => _WhatsMindState();
}

class _WhatsMindState extends State<WhatsMind> {
    String color="";
    Map map={};
  final TextEditingController _controller = TextEditingController();
    api()async{
    var a=await httpRequest(REQUEST_TYPE.GET, '$baseUrl/post/${widget.id}', {
    });
    a= await jsonDecode(a.body);
    setState(() {
      map=a;
      print(map);
      _controller.text=map['post'];
      color =map['background'];
    });
  }
  @override
  void initState() {
    super.initState();
   if(widget.id!=null){
     api();
   }
  }
    bool _select1 = false;
    bool _select2 =false;
    bool _select3 =false;
    bool _select4 =false;
    bool _select5 =false;
    bool _select6 =false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black,size: 30),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          title: const Text('Ceate Post',style: TextStyle(color: Colors.black),),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white,elevation: 0),
              onPressed:()async {
                if(widget.id==null){
                  final response= await httpRequest(REQUEST_TYPE.POST,('${baseUrl}post') , {
                    //_controller
                    "post": _controller.text,
                    "background": color,
                  });
                  print(response.body);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                        (Route<dynamic> route) => false,
                  );
                }
                else{
                  final response= await httpRequest(REQUEST_TYPE.PUT, ('$baseUrl/post'),
                      { "id":widget.id,
                        'post': _controller.text,
                        "background":color,
                      });
                  print(response.body);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) =>  MyApp()),
                        (Route<dynamic> route) => false,
                  );
                }
              },
              child:   Text(widget.id==null?"Post":"Update",
                style: TextStyle(fontSize: 18,color: Colors.blue),)
          ),
        ],
      ),
      body: Padding( padding: EdgeInsets.only(bottom: 30),
          child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //const Profile(),
          Container(
              height: 90,
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

                ],
              )),
         Container(
           height: 200,
           color: (color==''?Colors.white:HexColor(color) ),
           child: Center(
             child: TextField(
             controller:_controller ,
             textAlign: TextAlign.center,
             decoration:
             const InputDecoration(hintText: 'What\'s on your mind ?',border: InputBorder.none,),
             style: const TextStyle(color: Colors.black,fontSize: 30,),
           ),)),
          Spacer(),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: SelectableContainer(
                      onValueChanged: (newValue) {
                        setState(() {
                          _select1 = newValue;
                           color='#b4eeb4';
                           _select2 =false;
                           _select3 =false;
                           _select4 =false;
                           _select5 =false;
                           _select6 =false;
                        });
                      },
                      selected: _select1,
                      child:  Container(
                        height: 40,width: 40,
                        decoration: BoxDecoration(color: HexColor('#b4eeb4'),
                            borderRadius: BorderRadius.circular(10)),
                      )
                  ),
                ),
                Container(
                  child: SelectableContainer(
                      onValueChanged: (newValue) {
                        setState(() {
                          _select2 = newValue;
                          color='fdef19';
                          _select1 =false;
                          _select3 =false;
                          _select4 =false;
                          _select5 =false;
                          _select6 =false;

                        });
                      },
                      selected: _select2,
                      child:  Container(
                        height: 40,width: 40,
                        decoration: BoxDecoration(color: HexColor('fdef19'),
                            borderRadius: BorderRadius.circular(10)),
                      )
                  ),
                ),
                Container(
                  child: SelectableContainer(
                      onValueChanged: (newValue) {
                        setState(() {
                          _select3 = newValue;
                          color='39ff14';
                          _select2 =false;
                          _select4 =false;
                          _select1 =false;
                          _select5 =false;
                          _select6 =false;
                        });
                      },
                      selected: _select3,
                      child:  Container(
                        height: 40,width: 40,
                        decoration: BoxDecoration(color: HexColor('39ff14'),
                            borderRadius: BorderRadius.circular(10)),
                      )
                  ),
                ),
                Container(
                  child: SelectableContainer(
                      onValueChanged: (newValue) {
                        setState(() {
                          _select4 = newValue;
                          color='2ad3ff';
                          _select2 =false;
                          _select3 =false;
                          _select1 =false;
                          _select5 =false;
                          _select6 =false;
                        });
                      },
                      selected: _select4,
                      child:  Container(
                        height: 40,width: 40,
                        decoration: BoxDecoration(color: HexColor('2ad3ff'),
                            borderRadius: BorderRadius.circular(10)),
                      )
                  ),
                ),
                Container(
                  child: SelectableContainer(
                      onValueChanged: (newValue) {
                        setState(() {
                          _select5 = newValue;
                          color='ffc3a0';
                          _select2 =false;
                          _select3 =false;
                          _select4 =false;
                          _select1 =false;
                          _select6 =false;
                        });
                      },
                      selected: _select5,
                      child:  Container(
                        height: 40,width: 40,
                        decoration: BoxDecoration(color: HexColor('ffc3a0'),
                            borderRadius: BorderRadius.circular(10)),
                      )
                  ),
                ),
                Container(
                  child: SelectableContainer(
                      onValueChanged: (newValue) {
                        setState(() {
                          _select6 = newValue;
                          color='#ff3232';
                          _select2 =false;
                          _select3 =false;
                          _select4 =false;
                          _select5 =false;
                          _select1 =false;
                        });
                      },
                      selected: _select6,
                      child:  Container(
                        height: 40,width: 40,
                        decoration: BoxDecoration(color:HexColor('#ff3232'),
                            borderRadius: BorderRadius.circular(10)),
                      )
                  ),
                ),

              ],
            ),

        ],
      )),
    );
  }
}



class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}