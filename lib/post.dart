
import 'package:flutter/material.dart';
import 'package:untitled2/pro_image.dart';
import 'package:untitled2/whats_on_mind.dart';
import 'insidefilter.dart';
class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          height: 50,width: 340,
          // color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Post",style: TextStyle(
                  color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),
              ),
              Filter(),
            ],
          ),
        ),
        Container(
          //  color: Colors.red,
          height: 50,width: 350,
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: ImagePro(),
              ),
              Padding(padding: EdgeInsets.only(left: 0)),

              SizedBox(
                height: 35,
                width: 280,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 150,
                  primary: Colors.white70, // Background color
                ),
                child: Align(alignment: Alignment.centerLeft,
                  child:Text("What's on your mind?",style: TextStyle(
                    color: Colors.black,fontSize: 20),),),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WhatsMind()),
                  );
                },
              ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

///               ///////////////
class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(color: Colors.black26,
              borderRadius: BorderRadius.circular(5)
          ),

          child: InkWell(
            child:Icon(Icons.filter_list,size: 28,) ,
            borderRadius: BorderRadius.circular(10),
            onTap: (){
              showModalBottomSheet(context: context,
                builder:(context){
                  return  SizedBox(
                    height: 230,
                    child: InsideFilter(),
                  );
                },shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),topRight: Radius.circular(20)
                ),
                ),
              );
            },
          ),
        )
    );
  }
}
